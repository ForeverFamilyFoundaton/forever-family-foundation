$ ->
  $('.use_biz_address :checkbox').click ->
    biz = $('.group.biz_address')
    billing = $('.group.billing_address')
    
    billing.find('input.address').val(biz.find('input.address').val())
    billing.find('input.city').val(biz.find('input.city').val())  
    billing.find('input.state').val(biz.find('input.state').val())
    billing.find('input.zip').val(biz.find('input.zip').val())        