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
# The alert page
class AlertPage < ADFBasePage
  # Ensures that the page is present by checking if it's title is displayed
  def trait
    get_toolbar_title('Alerts and Dialogues')
  end

  # Checks for modal alert message
  def check_for_modal_alert_page
    wait_for_element_exists("* text CONTAINS[c] 'toast'}")
  end

  # checks if alert is displayed
  def check_for_alert_message
    wait_for_element_exists("* {text CONTAINS[c] 'This is the alert message'}")
  end

  # Checks if alert dismissed
  def check_for_dismissed_alert
    wait_for_text_to_disappear('This is the alert message')
  end
  
  def check_modal_page_alert(arg1, arg2)
    wait_for_element_exists("UILabel text:'#{arg1}'")
    wait_for_element_exists("UIButtonLabel text:'#{arg2}'")
  end

   # checks if alert is displayed
  def check_for_alert_message(arg1, arg2)
    wait_for_element_exists("UILabel text:'#{arg1}'")
    wait_for_element_exists("UILabel text:'#{arg2}'")
  end

  def check_for_dismissed_modal_alert_page(arg)
    wait_for_element_does_not_exist("* text:'#{arg}'")
  end

  def check_for_dismissed_alert_message(arg)
    wait_for_element_does_not_exist("* text:'#{arg}'")
  end 
end
