class Profile < ActiveRecord::Base
  belongs_to :bit
  scope :visible,   -> { where(location_visible: true) }
  validates_presence_of :bit_id
  has_attached_file :avatar, :styles => { :medium => "400x400>", :small => "200x200>", :thumb => "64x64#" }, :default_url => "/images/:style/missing.png", dependant: :destroy
end
