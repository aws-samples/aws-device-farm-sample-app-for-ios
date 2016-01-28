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

class NativeComponent < ADFBasePage
  # Ensures that the page is present by checking if it's title is displayed
  def trait
    get_toolbar_title('Native Components')
  end

  # Checks if the image gridview exists within the view
  def check_for_image_gallery_grid
    wait_for_element_exists("ImageGalleryCollectionViewCell")
  end

  # Checks to see if the scrollview exists
  def check_for_scrollview
    wait_for_element_exists("UIScrollView")
  end

  # Checks to see if the movie is playing by checking it's content description
  def check_for_movie_playing

  end

  # Checks to see if the camera preview is ongoing by checking it's content description
  # Fails on devices with no camera support
  def check_for_camera_preview
    wait_for_element_exists("* id:'CameraView'")
  end

  # Scrolls to the content
  def scroll_to_see(content)
    scroll("UIScrollView", :up)
  end
end
