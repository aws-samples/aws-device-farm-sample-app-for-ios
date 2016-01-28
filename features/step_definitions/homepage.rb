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
Given(/^I am on the Homepage$/) do
  @current_page = page(HomePage)
end

Then(/^I should see all the information$/) do
  @current_page.assert_info_viewable
end

Then(/^I take a screenshot$/) do
  screenshot_embed
end
