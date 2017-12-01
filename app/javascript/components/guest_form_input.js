const guest = document.getElementById('guest');
if (guest) {
  guest.addEventListener("change", () => {
    guest.classList.remove('unselected');
  });
}
