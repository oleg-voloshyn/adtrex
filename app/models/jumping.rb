class Jumping < ActiveRecord::Base
  validates :name, :height, :free_height, presence: true
  validates :name, length: { minimum: 2, maximum: 150 }, uniqueness: true

  # TYPE = [
  #   '1' => 'Rope jumping',
  #   '2' => 'Bungee jumping'
  # ]
end
