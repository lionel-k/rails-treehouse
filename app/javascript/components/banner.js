import Typed from 'typed.js';

function loadDynamicBannerText() {
  const bannerText = document.getElementById('banner-typed-text');
  if (bannerText) {
    new Typed('#banner-typed-text', {
      strings: ["Find a place to chill", "Be closer to nature"],
      typeSpeed: 80,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
