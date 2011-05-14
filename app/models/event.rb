class Event < ActiveRecord::Base
  has_many :comments, :inverse_of => :event, :dependent => :destroy
  validates_presence_of :name, :description

  default_scope order('id DESC')
end
