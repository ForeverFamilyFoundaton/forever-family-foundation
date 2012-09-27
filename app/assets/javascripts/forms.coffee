$ ->
  $('.use_biz_address :checkbox').click ->
    biz = $('.group.biz_address')
    billing = $('.group.billing_address')
    
    if this.checked
      billing.find('input.address').val(biz.find('input.address').val())
      billing.find('input.city').val(biz.find('input.city').val())  
      billing.find('input.state').val(biz.find('input.state').val())
      billing.find('input.zip').val(biz.find('input.zip').val())        
      billing.find('select').val(biz.find('select').val())        
    else
      billing.find('input.address').val('')
      billing.find('input.city').val('')  
      billing.find('input.state').val('')
      billing.find('input.zip').val('')        
      billing.find('select').val('')              
    