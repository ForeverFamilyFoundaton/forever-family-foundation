function alert_test(){
  alert("hello")
}

function donation_click() {
  ga('send','event',{eventCategory:'Donate',eventAction:'Make a Donation',eventLabel:'Click'});
}