importScripts('https://www.gstatic.com/firebasejs/9.14.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.14.0/firebase-messaging-compat.js');

const firebaseConfig = {
  apiKey: 'AIzaSyCde0F3bF4Eb7aXsz4zquNNHaUTOuXoGJ4',
  authDomain: 'hankalis-clan-851df.firebaseapp.com',
  projectId: 'hankalis-clan-851df',
  storageBucket: 'hankalis-clan-851df.firebaseapp.com',
  messagingSenderId: '103364723036',
  appId: '1:103364723036:web:e7b98fbbf5724c0c900199'
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

self.addEventListener('fetch', (event) => {
  event.respondWith(fetch(event.request));
});