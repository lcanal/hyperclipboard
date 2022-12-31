class ArchiveClipsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Clip.expire_clips
  end
end
