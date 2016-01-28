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
class LoginPage < ADFBasePage
  # Ensures that the page is present by checking if it's title is displayed
  def trait
    get_toolbar_title('Login Page')
  end

  # Checks to see if the user name and password fields exist within the view
  def check_if_login_fields_exists
    wait_for_element_exists(user_name_field)
    wait_for_element_exists(password_field)
  end

  # checks if the login button exists within the view
  def check_if_login_button_exists
    wait_for_element_exists(login_button)
  end

  # Enters the credentials within the login form
  def enter_creds(username, password)
    touch("UITextField index:0")
    keyboard_enter_text(username)
    array = touch("UITextField index:1")
    keyboard_enter_text(password)
    tap_keyboard_action_key
  end

  # Checks to see if the logged in or login error text matches expected value
  def verify_alt_message (message)
    wait_for_element_exists("UILabel text:'#{message}'")
  end

  # Checks to see if the logged in or login error button text matches expected value
  def verify_alt_button_text (text)
    wait_for_element_exists("UIButtonLabel text:'#{text}'")
  end

  # The user name input id
  def user_name_field
    "UITextFieldLabel text:'Username'"
  end

  # The password input field id
  def password_field
    "UITextFieldLabel text:'Password'"
  end

  # The login button id
  def login_button
    "UIButtonLabel text:'Login'"
  end

  # The second screen's message id
  def alt_message_id
    'login_alt_message_textView'
  end

  # The second screen logout/try again button id
  def alt_button_id
    'alt_button'
  end

end
