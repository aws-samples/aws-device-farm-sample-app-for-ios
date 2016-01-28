#
# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
# http://aws.amazon.com/apache2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
#
And(/^I am on the Login Page$/) do
  @current_page = page(LoginPage)
end

Then(/^I should see the login message "([^"]*)"$/) do |arg|
  @current_page.verify_alt_message (arg)
end

And(/^I should see the login button$/) do
  @current_page.check_if_login_button_exists
end

When(/^I type valid login credentials$/) do
  creds = CREDS[:valid]
  @current_page.enter_creds(creds[:username], creds[:password])
end

And(/^I should see the logout button with text "([^"]*)"$/) do |arg|
  @current_page.verify_alt_button_text(arg)
end

When(/^I type invalid login credentials$/) do
  creds = CREDS[:invalid]
  @current_page.enter_creds(creds[:username], creds[:password])
end

Then(/^I should see the error message "([^"]*)"$/) do |arg|
  @current_page.verify_alt_message(arg)
end

And(/^I should see the try again button with text "([^"]*)"$/) do |arg|
  @current_page.verify_alt_button_text(arg)
end

Then(/^I should see the login fields$/) do
  @current_page.check_if_login_fields_exists
end
