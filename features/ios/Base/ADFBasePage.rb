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
require 'calabash-cucumber/core'
require 'calabash-cucumber/ibase'


# A base class for all of the different pages within the app
# Contains helper methods for convenience
#class ADFBasePage < Calabash::Core
class ADFBasePage < Calabash::IBase

  # Returns the current title of the toolbar
  def get_toolbar_title(name)
    "AppCompatTextView id:'toolbar_title' text:'#{name}'"
  end

  # Waits and checks to see if a specific element with an id exists within the view
  def check_if_id_exists(id)
    wait_for_element_exists("* id:'#{id}'")
  end

  # waits and checks if a specific element containing a specific test is within the view
  def check_if_id_contains_text(id, text)
    wait_for_element_exists("* id:'#{id}' {text CONTAINS[c] '#{text}'}")
  end

  def check_if_label_contains_text(text)
    puts(text)
    check_element_exists("UILabel text:'#{text}'")
  end


end
