class Clip < ApplicationRecord
  has_one_attached :image, dependent: :destroy

  def display_image
    return image if image.attached?
    og_images[0] unless og_images.empty?
  end

  def image_link
    return image if image.attached?
    url
  end

  def image_tag
    return image.representation(resize_to_limit: [400, 400]) if image.attached?
    display_image
  end
end
