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
require 'calabash-cucumber/operations'

#The helper class for navigation across the app
class Navigator
  include Calabash::Cucumber::Operations

  # Navigates to a category row within the navigation drawer
  #
  # Opens the navigation drawer and then searches and scrolls for the category
  # row within the list view. Once located the row is clicked in order to navigate
  # category. If the navigation drawer scrolls to the end of the list and connect
  # find the category then the navigation fails.
  def navigate_to(category)
    touch("* contentDescription:'#{get_app_name}'")

    element = query("* id:'drawer_row_title' text:'#{category}'")
    last_y_height = query("* id:'drawer_row_title'").last["rect"]["y"]
    while element.empty?
      scroll('recyclerview', :down)
      next_y_height = query("* id:'drawer_row_title'").last['rect']['y']
      element = query("* id:'drawer_row_title' text:'#{category}'")

      if last_y_height == next_y_height
        fail('You reached the end of the drawer list and category cannot be found')
      end
    end

    touch("* id:'drawer_row_title' text:'#{category}'")
  end

  # Navigates to a specific view page title within a view pager
  # Iterates through all of the pages until the title can be found
  #
  # If the page's number goes twice then the navigation fails
  def navigate_to_page(page)
    fail = true
    number_of_pages = query("* id:'view_pager1'",
                          { method_name:'getAdapter', arguments: [] },
                          { method_name: 'getCount', arguments: [] })

    number_of_pages.first.times do
      current_page_number = query("* id:'view_pager1'",
                                { method_name: 'getCurrentItem', arguments: [] })
      page_title = query("* id:'view_pager1'",
                        { method_name: 'getAdapter', arguments: [] },
                        { method_name: 'getPageTitle', arguments: [current_page_number.first] } )

      if page_title.first == page
        fail = false
        break
      end
      pan_left
    end

    if fail
      fail("couldn't find the page")
    end
  end

  # Returns the app name, which is set as the content description
  # for the drawer toggle.
  def get_app_name
    'ReferenceApp'
  end
end
