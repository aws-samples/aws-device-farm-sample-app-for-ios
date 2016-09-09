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
And(/^I am on the Nested View Page$/) do
  @current_page = page(NestedViewPage)
  # Sleep to give page time to fully render
  sleep(STEP_PAUSE)
end

When(/^I navigate up$/) do
  @current_page.navigate_up
end

Then(/^I should see the "([^"]*)" number$/) do |arg|
  @current_page.verify_number(arg)
end

Then(/^I should see label containing "([^"]*)"$/) do |arg|
  @current_page.check_for_label_containing(arg)
end

When(/^I press the Back button (\d+)$/) do |arg|
  @current_page.press_back_button_times(arg)
end

When(/^I press the Next button (\d+)$/) do |arg|
  @current_page.press_next_level_button(arg)
end
