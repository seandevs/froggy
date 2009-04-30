class Frog < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  
  def self.latest
    find(:all, :order => 'id DESC')
  end
end
