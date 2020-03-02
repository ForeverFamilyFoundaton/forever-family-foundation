$(function() {
  const stripe_public_key = $('meta[name=stripe-public-key]').attr("content");
  const stripe = Stripe(stripe_public_key);
  let elements = stripe.elements();

   const style = {
    base: {
      color: '#32325d',
      lineHeight: '18px',
      fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
      fontSmoothing: 'antialiased',
      fontSize: '16px',
      '::placeholder': {
        color: '#aab7c4'
      }
    },
    invalid: {
      color: '#fa755a',
      iconColor: '#fa755a'
    }
  };
  const cardElement = elements.create('card', { style: style });
  // Add an instance of the card Element into the `card-element` <div>.
  cardElement.mount('#card-element');

  // show errors
  cardElement.addEventListener('change', ({error}) => {
    const displayError = document.getElementById('card-errors');
    if (error) {
      displayError.textContent = error.message;
    } else {
      displayError.textContent = '';
    }
  });

  const form = document.getElementById('new_subscription');

  form.addEventListener('submit', async (event) => {
    event.preventDefault();

    const result = await stripe.createPaymentMethod({
      type: 'card',
      card: cardElement,
      billing_details: {
        email: 'jenny.rosen@example.com',
      },
    })

    stripePaymentMethodHandler(result);
  });


  const stripePaymentMethodHandler = async (result) => {
    if (result.error) {
      console.log(result.error);
      // Show error in payment form
    } else {
      // Otherwise send paymentMethod.id to your server
      const res = await fetch('/subscriptions', {
        method: 'post',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({
          email: 'jenny.rosen@example.com',
          payment_method: result.paymentMethod.id
        }),
      });

      // The customer has been created
      const customer = await res.json();
    }
  }
});
