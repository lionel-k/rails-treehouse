import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Find the best treehouse for a very low price"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
