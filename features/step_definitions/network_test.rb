Given /^I am on the ADF Welcome Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Then /^the webview should be loaded$/ do
   num =  query("UIWebView {accessibilityIdentifier LIKE 'webview loaded'}").count
   if (num == 0)
     raise("Webview isn't loading or there is no wifi")
   end
end

Then /^I wait for the webview to load$/ do
   wait_for(timeout:30, timeout_message: 'Google took 30 seconds to load... The internet is potato') do
    element_exists("UIWebView {accessibilityIdentifier LIKE 'webview loaded'}") ||
    element_exists("UIWebView {accessibilityIdentifier LIKE 'webview failure'}")
   end


end
