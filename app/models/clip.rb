class Clip < ApplicationRecord
  def display_image
    return og_images[0] unless og_images.empty?
  end
end
