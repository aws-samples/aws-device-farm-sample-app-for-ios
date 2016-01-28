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
class HomePage < ADFBasePage
  # Ensures that the page is present by checking if it's title is displayed
  def trait
    get_toolbar_title('Homepage')
  end

  # Checks if all of the homepage's elements are within the view
  def assert_info_viewable
    #%w('Version 1').each do |value|
    #  puts(value)
    check_if_label_contains_text('Version 1')
    #end
  end
end
