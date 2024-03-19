'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "096d149e058839b969495e3445885d52",
"splash/img/light-2x.png": "26d608c777b3e429d564c2f11db190f6",
"splash/img/dark-4x.png": "ae0c24b94f2e9b037ad1d098422519af",
"splash/img/light-3x.png": "d5a487fa76ae0e4b07396b1913bba3d1",
"splash/img/dark-3x.png": "d5a487fa76ae0e4b07396b1913bba3d1",
"splash/img/light-4x.png": "ae0c24b94f2e9b037ad1d098422519af",
"splash/img/dark-2x.png": "26d608c777b3e429d564c2f11db190f6",
"splash/img/dark-1x.png": "37b6fc1dec1fa7c8bb12a35f1988830b",
"splash/img/light-1x.png": "37b6fc1dec1fa7c8bb12a35f1988830b",
"index.html": "7ebde7a98f823540d744a92162d9e42f",
"/": "7ebde7a98f823540d744a92162d9e42f",
"main.dart.js": "6624e9f9e17b1ef48d62c53b4d22b636",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "913dacc06281171aa64c1aad724823a4",
"icons/Icon-192.png": "5e1067800af1e78e56f7d8da84391d17",
"icons/Icon-maskable-192.png": "5e1067800af1e78e56f7d8da84391d17",
"icons/Icon-maskable-512.png": "26d608c777b3e429d564c2f11db190f6",
"icons/Icon-512.png": "26d608c777b3e429d564c2f11db190f6",
"manifest.json": "c0188d486e8dd8dbb7c642bee3fd5df9",
"assets/varliklar/icon.png": "819b5b85cddafe8de7d5545e1bd2fe40",
"assets/varliklar/resimler/ProfilPhoto.jpg": "5ff08867cc78b8ada6a3cc4f8e84b2dc",
"assets/varliklar/resimler/Nike1.png": "8017714680ff49b88fc22ea78caff25b",
"assets/varliklar/resimler/search-normal.png": "8807a983ba4d02cb8f9afe5fee283125",
"assets/varliklar/resimler/fashion.png": "40ac696debe2136ba59afbf0cd57522e",
"assets/varliklar/resimler/ElectronicCart.png": "05edde4ab15f8361f3c4a30e1cdc25ec",
"assets/varliklar/resimler/NikeSky2.png": "8a0a45d5719dbdcf8e5cfe45d8b3cf1e",
"assets/varliklar/resimler/Background%2520Circle.png": "54e53687fccf9dff3ebdb381b18fc80c",
"assets/varliklar/resimler/H&M.png": "cd7be619eb871ec193e2c4095a650ea4",
"assets/varliklar/resimler/Slider1.png": "6782bf04a9dd01bca5192775fd708936",
"assets/varliklar/resimler/Slider3.jpg": "4ff3faf06fbe8b8f7e329425b59f0cef",
"assets/varliklar/resimler/FurnitureCart.png": "85a0755827dc459a2c6f68c59200a68c",
"assets/varliklar/resimler/Sneakers.png": "60a4cffdc8b55d0cae716b101b0551c7",
"assets/varliklar/resimler/Slider2.jpg": "6ae0c1a20b87b0e36f15462a87b11eec",
"assets/varliklar/resimler/Slider5.jpg": "d2f3b3bfa19525c2cdd06392bfac91a2",
"assets/varliklar/resimler/Slider4.jpg": "8919297e9e585082f82c22de5b75bdd8",
"assets/varliklar/resimler/AppliancesCart.png": "4fa14e50f119bbfb2ad05f798165bbdb",
"assets/varliklar/resimler/Adidas1.png": "3616916825e08e44f9798d850ce38df0",
"assets/varliklar/resimler/Calvin.png": "4f04dd9c95d7e1ce8161692354278e13",
"assets/varliklar/resimler/BeautyCart.png": "044a89bdd801b6e687259c99a8c061a4",
"assets/varliklar/resimler/Wrist.png": "d2a03937e6325f3045a7914ab731998f",
"assets/varliklar/resimler/FashionCart.png": "4adf58833af959cf22a6995bd80f86ad",
"assets/varliklar/resimler/electronic.png": "1364f88d4a2fb18690005c57d5680410",
"assets/varliklar/resimler/Running.png": "85cb199c1a15aea9353b7bb170c3c252",
"assets/varliklar/resimler/Speaker.png": "d18db53db8b1f3c854c3ceae21087215",
"assets/varliklar/resimler/notification.png": "5c151daf53624b46b25bfc34e5cbcd65",
"assets/varliklar/resimler/Allen.png": "cd6e0ef4b0a57d21261c59966b3cc131",
"assets/varliklar/resimler/ProfilPhoto1.jpg": "2d0647df73dac628be91dbf37d9756ae",
"assets/varliklar/resimler/bag.png": "b9625065e366035b50648d01dd10729b",
"assets/AssetManifest.json": "bbe35958f84dc5aace23cf7b596781b9",
"assets/NOTICES": "8714c87297532ca04fff7e241c2f470d",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "28c5214a41c976be5bbbf4f3dba252a7",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "afe278f06bcf17372a84d7bdca804116",
"assets/fonts/MaterialIcons-Regular.otf": "1f2d9a014ce974f1fcfe8d5a4435ce36",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
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
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
