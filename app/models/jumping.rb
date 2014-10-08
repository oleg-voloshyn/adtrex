class Jumping < ActiveRecord::Base
  has_many :locations, as: :locationable

  validates :name, :height, presence: true
  validates :name, length: { minimum: 2, maximum: 150 }, uniqueness: true

  mount_uploader :image, ImageUploader

  # TYPE = [
  #   '1' => 'Rope jumping',
  #   '2' => 'Bungee jumping'
  # ]
end
