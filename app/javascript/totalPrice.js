const checkin = document.getElementById("range_start");
const checkout = document.getElementById("range_end");
const computePrice = () => {
  const start = document.getElementById("range_start").value;
  console.log(start);
  const start_date = new Date(start.split('-')[0], start.split('-')[1], start.split('-')[2]);
  const end = document.getElementById("range_end").value;
  console.log(end);
  const end_date = new Date(end.split('-')[0], end.split('-')[1], end.split('-')[2]);
  const diffDays = parseInt((end_date - start_date) / (1000 * 60 * 60 * 24));
  console.log(diffDays);
  const price = parseInt(document.getElementById("price_per_night").innerText.split("€")[0]);
  const total_price = price * diffDays;
  console.log(total_price);
  if (isNaN(total_price)){
    console.log("") ;
  }
  else{
    document.getElementById("total_price").innerHTML = '<p><strong> Total: ' + total_price + '€ </strong></p>';
  }
}

[checkin, checkout].forEach((input) => {
  input.addEventListener(("change"), computePrice);
})


