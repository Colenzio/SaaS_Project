/* global $, Stripe */
//Document ready
$(document).on('turbolinks:load', function(){
  var theForm = $('#pro_form');
  var submitBtn = $('#form-submit-btn');
  
  //Set Stripe public key
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content') )
  
  //When user clicks form submit button,
  submitBtn.click(function(event){
  //when user clicks, the default behavour is halted
    event.preventDefault();
  )};
  
  //Collect credit card field
   var ccNum = $('#card_number').val(),
       cvcNum = $('#card_code').val(),
       expMonth = $('#card_month').val(),
       expYear = $('#card_year').val();

  //Send ard fields to stripe
  Stripe.createToken({
    number: ccNum,
    cvc: cvcNum,
    exp_month: expMonth,
    exp_year: expYear
  }, stripeResponseHandler);

  //Stripe will return back with card token
  //Inject card token as hidden field into form
  //Submit form into our rails app

});
