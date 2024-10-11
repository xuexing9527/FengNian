const CACHE_NAME = 'pwa-cache-v1';
const urlsToCache = [
    '/',
    '/index.html',
    '/styles.css',
    '/script.js',
];

// 安装阶段，缓存所有资源
self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME)
        .then((cache) => {
            console.log('Opened cache');
            return cache.addAll(urlsToCache);
        })
    );
});

// 拦截 HTTP 请求，离线时从缓存中获取资源
self.addEventListener('fetch', (event) => {
    event.respondWith(
        caches.match(event.request)
        .then((response) => {
            if (response) {
                return response; // 如果缓存中有资源，返回缓存内容
            }
            return fetch(event.request); // 否则从网络获取资源
        })
    );
});
