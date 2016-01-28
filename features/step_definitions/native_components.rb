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
And(/^I am on the Native Component Page$/) do
  @current_page = page(NativeComponent)
end

Then(/^I should see the image gallery grid$/) do
  @current_page.check_for_image_gallery_grid
end

Then(/^I should see a scrollview$/) do
  @current_page.check_for_scrollview
end

Then(/^I should see a movie playing$/) do
  @current_page.check_for_movie_playing
end

Then(/^I should see a camera preview$/) do
  @current_page.check_for_camera_preview
end

Then(/^I should scroll to see "([^"]*)"$/) do |arg|
  @current_page.scroll_to_see(arg)
end
