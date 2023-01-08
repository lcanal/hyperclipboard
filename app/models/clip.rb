class Clip < ApplicationRecord
  has_one_attached :image, dependent: :destroy!

  def display_image
    return image if image.attached?
    og_images[0] unless og_images.empty?
  end

  def image_link
    return image if image.attached?
    url
  end

  def image_tag
    return image.representation(resize_to_limit: [1000, 1000]) if image.attached?
    display_image
  end

  def self.expire_clips
    clips = Clip.where('expires < ?', Time.now)
    puts "Found #{clips.length} number of clips to expire"
    clips.destroy_all unless clips.length <= 0
  end
end
