// these are tracking codes for Google

function test_alert() {
  alert("hello");
}

function contact_email_click() {
  ga('send', 'event', { eventCategory: 'Contact', eventAction: 'Email', eventLabel: 'Click'});
}

function donation_click() {
  ga('send','event',{eventCategory:'Donate',eventAction:'Make a Donation',eventLabel:'Click'});
}

function just_give_click() {
  ga('send', 'event', { eventCategory: 'Donate', eventAction: 'Just Give', eventLabel: 'Click'});
}

function event_register_click(name) {
  var str1 = "'send', 'event', { eventCategory: 'Event', eventAction: '";
  var str2 = "', eventLabel: 'Register'}";
  var res = str1.concat(name, str2);
  ga(res);
}

function personal_membership_register_click() {
  ga('send', 'event', { eventCategory: 'Membership', eventAction: 'Personal', eventLabel: 'Register'});
}

function business_membership_register_click() {
  ga('send', 'event', { eventCategory: 'Membership', eventAction: 'Business', eventLabel: 'Register'});
}

function the_sign_registry_click() {
  ga('send', 'event', { eventCategory: 'Shopping', eventAction: 'The Sign Registry', eventLabel: 'Click'});
}

function igive_click() {
  ga('send', 'event', { eventCategory: 'Shopping', eventAction: 'iGive', eventLabel: 'Click'});
}

function amazon_click() {
  ga('send', 'event', { eventCategory: 'Shopping', eventAction: 'Amazon', eventLabel: 'Click'});
}

function love_knows_no_death_selz_click() {
  ga('send', 'event', { eventCategory: 'Shopping', eventAction: 'Love Knows No Death', eventLabel: 'Selz'});
}

function love_knows_no_death_amazon_click() {
  ga('send', 'event', { eventCategory: 'Shopping', eventAction: 'Love Knows No Death', eventLabel: 'Amazon'});
}

function in_the_light_selz_click() {
  ga('send', 'event', { eventCategory: 'Shopping', eventAction: 'In The Light', eventLabel: 'Selz'});
}

function facebook_click() {
  ga('send', 'event', { eventCategory: 'Social media', eventAction: 'Facebook', eventLabel: 'Click'});
}

function instagram_click() {
  ga('send', 'event', { eventCategory: 'Social media', eventAction: 'Instagram', eventLabel: 'Click'});
}

function pinterest_click() {
  ga('send', 'event', { eventCategory: 'Social media', eventAction: 'Pinterest', eventLabel: 'Click'});
}

function linkedin_click() {
  ga('send', 'event', { eventCategory: 'Social media', eventAction: 'LinkedIn', eventLabel: 'Click'});
}

function twitter_click() {
  ga('send', 'event', { eventCategory: 'Social media', eventAction: 'Twitter', eventLabel: 'Click'});
}

function youtube_click() {
  ga('send', 'event', { eventCategory: 'Social media', eventAction: 'Youtube', eventLabel: 'Click'});
}

function store_cart_click(product) {
  var str1 = "'send', 'event', { eventCategory: 'Store', eventAction: '";
  var str2 = "', eventLabel: 'Cart'}";
  ga(str1.concat(product, str2));
}

function volunteer_email_click() {
  ga('send', 'event', { eventCategory: 'Volunteer', eventAction: 'Email', eventLabel: 'Click'});
}

