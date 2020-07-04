'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "fef47449b804162327d1ccf54747dcd2",
"assets/assets/img/cesilogo.png": "062a079cc98f5100b9d49bebcc00a23c",
"assets/assets/img/missing_flag.png": "6171962998cf5a1657ce5e7408ad93f3",
"assets/assets/img/virus-logo.png": "4290a5bb9e8ab4ca1b60ece1feaac645",
"assets/assets/l10n/flags/en.png": "a2080b2d193dbbd3cb34b32ad919da62",
"assets/assets/l10n/flags/fr.png": "263b1555d79501643919e5a3c4559b4f",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/NOTICES": "225b74ba3324d43c56be2217ffc3d48e",
"favicon.ico": "cd78fd2732d09d2595ba1b16b9d6a488",
"icons/android-icon-144x144.png": "fb70f5cda7db961105feb0f09b6f2899",
"icons/android-icon-192x192.png": "cb618464d5fe4baffb584ad6767490cd",
"icons/android-icon-36x36.png": "cfb10bc6c6911e0badcb3bfda53e16bc",
"icons/android-icon-48x48.png": "2dda2caee939071fbbefdff3f682092a",
"icons/android-icon-72x72.png": "5882146b5afc05b9aa453dabf54b0ae2",
"icons/android-icon-96x96.png": "0b4366d984ea81a65f7622874025b7f5",
"icons/apple-icon-114x114.png": "8731bc4cba4699569612558a057e8a61",
"icons/apple-icon-120x120.png": "e3aa05759d8a48002cc6bb0a5569386a",
"icons/apple-icon-144x144.png": "fb70f5cda7db961105feb0f09b6f2899",
"icons/apple-icon-152x152.png": "c331fb6e1a7a45c763cd1f3faf9ac245",
"icons/apple-icon-180x180.png": "354dd1dddf28e49de852d706f219b151",
"icons/apple-icon-57x57.png": "ea87f8e78743d32206a2cb8e502a5da2",
"icons/apple-icon-60x60.png": "11b039af7e9cdc376923a7ea126e7a50",
"icons/apple-icon-72x72.png": "5882146b5afc05b9aa453dabf54b0ae2",
"icons/apple-icon-76x76.png": "ba2a5646cf8ac70965183973985d0d23",
"icons/apple-icon-precomposed.png": "12421e5c510883f1452543de682452cc",
"icons/apple-icon.png": "12421e5c510883f1452543de682452cc",
"icons/browserconfig.xml": "97775b1fd3b6e6c13fc719c2c7dd0ffe",
"icons/favicon-16x16.png": "1493a490c5f6f567901b9c0fa025b541",
"icons/favicon-32x32.png": "6961d0499014897a294a6f5ca44cab3e",
"icons/favicon-96x96.png": "0b4366d984ea81a65f7622874025b7f5",
"icons/ms-icon-144x144.png": "fb70f5cda7db961105feb0f09b6f2899",
"icons/ms-icon-150x150.png": "d2666d34f8e35bcc030db6abb46537a3",
"icons/ms-icon-310x310.png": "e713087c3f8267181e040602bda3f87c",
"icons/ms-icon-70x70.png": "48f490a64da323b6fe6daa506471699b",
"index.html": "7c005a087ba16c486930d78d526505a5",
"/": "7c005a087ba16c486930d78d526505a5",
"main.dart.js": "484907ad4c41b130a0aae399371a052a",
"manifest.json": "610bcc38a0da86239a4f9d2472cb7d67"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/LICENSE",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      // Provide a no-cache param to ensure the latest version is downloaded.
      return cache.addAll(CORE.map((value) => new Request(value, {'cache': 'no-cache'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'no-cache'});
        return response || fetch(modifiedRequest).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.message == 'skipWaiting') {
    return self.skipWaiting();
  }

  if (event.message = 'downloadOffline') {
    downloadOffline();
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.add(resourceKey);
    }
  }
  return Cache.addAll(resources);
}
