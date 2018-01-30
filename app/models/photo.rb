class Photo < ApplicationRecord
  mount_uploader :data, PhotoUploader

  belongs_to :project

  validates :height, :width, numericality: { integer_only: true }

  validates :data, presence: true
end
