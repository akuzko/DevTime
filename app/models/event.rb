class Event < ActiveRecord::Base
  has_many :comments, :inverse_of => :event, :dependent => :destroy
end
