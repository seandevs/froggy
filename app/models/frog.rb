class Frog < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :user
  has_many :votes
  
  def self.latest
    find(:all, :order => 'id DESC')
  end
end
