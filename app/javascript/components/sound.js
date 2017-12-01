function soundOver () {
  var button = document.getElementById('clickme');
  if (button) {
    const audio = new Audio(button.dataset.soundUrl);


    button.addEventListener('click', (e) => {
      e.preventDefault();
      audio.play();
      setTimeout(6000);
    });
  }
}

export { soundOver };
