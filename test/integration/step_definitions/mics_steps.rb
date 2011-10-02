Then /^I debug$/ do
  debugger
  0
end

Then /^I pause$/ do
  STDIN.gets
end