Given /^I am on the ADF Welcome Screen$/ do
  element_exists("view")
  # Sleep to give page time to fully render
  sleep(STEP_PAUSE)
end

Then /^the webview should be loaded$/ do

end

Then /^I wait for the webview to load$/ do

end
