import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".datepicker", {
  altInput: true
})


// flatpickr("#range_start", {
//   altInput: true,
//   plugins: [new rangePlugin({ input: "#range_end"})]
// })
