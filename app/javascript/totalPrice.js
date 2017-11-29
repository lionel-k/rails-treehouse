console.log("Hello from total_price");

const start = document.getElementById("range_start").value
const end = document.getElementById("range_end").value

const start_date = new Date(start.split('-')[0], start.split('-')[1], start.split('-')[2]);
const end_date = new Date(end.split('-')[0], end.split('-')[1], end.split('-')[2]);
const diffDays = parseInt((end_date - start_date) / (1000 * 60 * 60 * 24));

const price = parseInt(document.getElementById("price_per_night").innerText.split("€")[0]);
console.log(price);

const total_price = price * diffDays;
console.log(total_price);
document.getElementById("total_price").innerHTML = '<p> Total: ' + total_price + '€</p>'

console.log("from total_price")
