// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDLz5YMvkJF55OB5cB8J1W6ZEgovSJzw6s",
  authDomain: "boxcricket-8bf35.firebaseapp.com",
  projectId: "boxcricket-8bf35",
  storageBucket: "boxcricket-8bf35.firebasestorage.app",
  messagingSenderId: "854223360801",
  appId: "1:854223360801:web:22d091de097659ebd5e460",
  measurementId: "G-E7PF0G5PHT"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);