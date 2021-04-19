class Movie < ApplicationRecord
 
  with_options presence: true do
    validates :text
    validates :instrument
  end

  mount_uploader :video_top ,VideoTopUploader
  validates :video_top, presence: true


  # has_one_attached :video_top
  belongs_to :user

end
