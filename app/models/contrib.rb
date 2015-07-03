class Contrib < ActiveRecord::Base
  belongs_to :user
  belongs_to :prompt
  
  validates_presence_of :headline, :body
  validates :headline, length: { maximum: 180 }end
