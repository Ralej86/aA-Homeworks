// timeout for 5 seconds
window.setTimeout(function () {
  alert('HAMMERTIME');
}, 5000);

//timeout with closure
function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`)
  });
}
