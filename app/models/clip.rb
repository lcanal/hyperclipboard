class Clip < ApplicationRecord
  has_one_attached :file, dependent: :destroy!

  def display_image
    return file if file.attached? && file.representable?
    og_images[0] unless og_images.empty?
  end

  def image_link
    return file if file.attached?
    url
  end

  def image_tag
    return file.representation(resize_to_limit: [1000, 1000]) if file.attached? && file.representable?
    display_image
  end

  def self.expire_clips
    clips = Clip.where('expires < ?', Time.now)
    puts "Found #{clips.length} number of clips to expire"
    clips.destroy_all unless clips.length <= 0
  end
end
