class Leg < ActiveRecord::Base
  belongs_to :frog
  
  def self.latest
    find(:all, :order => 'id DESC')
  end
end
