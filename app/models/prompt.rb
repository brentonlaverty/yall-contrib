class Prompt < ActiveRecord::Base
	
  belongs_to :user
  has_many :contribs

  validates_presence_of :headline, :body
  validates :headline, length: { maximum: 180 }end
