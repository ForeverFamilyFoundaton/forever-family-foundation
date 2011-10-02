Then /^I wait for the page to load$/i do
  wait_for_page_to_load
end

Then /^I wait for the AJAX to finish$/ do
  wait_for_ajax_to_load
end

def wait_for_page_to_load
  webrat.automate do 
    selenium.wait_for_page_to_load(5000) 
  end
end

def wait_for_ajax_to_load
  webrat.automate do 
    selenium.wait_for_condition("selenium.browserbot.getCurrentWindow().jQuery.active == 0;", 5000)
  end
end
