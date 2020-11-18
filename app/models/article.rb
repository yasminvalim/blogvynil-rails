class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 30, maximum: 1000 }
  validates :user_id, presence: true

  paginates_per 5

end