'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "5bc4f27c8862e93a92f9cb9a461405c3",
"assets/assets/cesilogo.png": "062a079cc98f5100b9d49bebcc00a23c",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "a323e59a51f62d9c80e896c299e2211a",
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
"main.dart.js": "d5ae88c0115c1643dd9f14674327c2d7",
"manifest.json": "610bcc38a0da86239a4f9d2472cb7d67"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
