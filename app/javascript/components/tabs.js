document.querySelectorAll(".tab").forEach(function(tab){
  tab.addEventListener("click", function(event) {
    document.querySelector(".active").classList.remove("active");
    event.currentTarget.classList.add("active");
    });
});



document.querySelector(".inbox-host").style.display = 'none';

document.querySelector(".tab-guest").addEventListener("click", function(event) {
  document.querySelector(".inbox-guest").style.display = 'block';
  document.querySelector(".inbox-host").style.display = 'none';
});

document.querySelector(".tab-host").addEventListener("click", function(event) {
  document.querySelector(".inbox-guest").style.display = 'none';
  document.querySelector(".inbox-host").style.display = 'block';
});
