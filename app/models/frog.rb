class Frog < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :user
  has_many :votes
  
  def self.latest
    find(:all, :order => 'id DESC')
  end
  
  def self.search(search)  
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"], :order => 'frogs.id DESC')
    else
      find(:all, :order => 'frogs.id DESC')
    end
  end
end
