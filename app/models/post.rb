class Post < ActiveRecord::Base
  belongs_to :bit
  has_many :comments, dependent: :destroy, order: 'created_at ASC'
  validates_presence_of :body, :bit_id
  after_save :notify
  
  def bit 
    @bit = Bit.find_by_id(self.bit_id)
    return @bit
  end
end
