import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["We love fruits", "And we love cocktails"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
