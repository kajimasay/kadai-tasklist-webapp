class Joblist < ApplicationRecord
  validates :content, presence: true,
   length: { maximum: 255}
  validates :status, presence: true,
   length: { maximum: 10}
   
  belongs_to :user
  
  validates :user_id, presence: true
end
