class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  validates :body, :presence => true
  validates :user_id, :presence => true
end
