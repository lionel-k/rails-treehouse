const tabs = document.querySelectorAll(".tab");
if (tabs) {
tabs.forEach(function(tab){
  tab.addEventListener("click", function(event) {
    document.querySelector(".active").classList.remove("active");
    event.currentTarget.classList.add("active");
    });
});
}

const inbox = document.querySelector(".inbox-host");
if (inbox) {
document.querySelector(".inbox-host").style.display = 'none';
}

const tabguest = document.querySelector(".tab-guest");
if (tabguest) {
document.querySelector(".tab-guest").addEventListener("click", function(event) {
  document.querySelector(".inbox-guest").style.display = 'block';
  document.querySelector(".inbox-host").style.display = 'none';
});
}

const tabhost = document.querySelector(".tab-host");
if (tabhost) {
document.querySelector(".tab-host").addEventListener("click", function(event) {
  document.querySelector(".inbox-guest").style.display = 'none';
  document.querySelector(".inbox-host").style.display = 'block';
});
}
