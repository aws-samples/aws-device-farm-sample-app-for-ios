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
And(/^I am on the Alerts Page$/) do
  @current_page = page(AlertPage)
end

Then(/^I should see the Modal Alert Page with text "([^"]*)" and button labelled "([^"]*)"$/) do |arg1, arg2|
  @current_page.check_modal_page_alert(arg1, arg2)
end

Then(/^I should see the Alert Message with text "([^"]*)" and button labelled "([^"]*)"$/) do |arg1, arg2|
  @current_page.check_for_alert_message(arg1, arg2)
end

Then(/^I should not see the Modal Alert Page with text "([^"]*)"$/) do |arg|
  @current_page.check_for_dismissed_modal_alert_page(arg)
end

Then(/^I should not see the Alert Message with text "([^"]*)"$/) do |arg|
  @current_page.check_for_dismissed_alert_message(arg)
end
