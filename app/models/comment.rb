class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :post_id, :bit_id, :body
  def replies
    @replies = Comment.where({:reply => true, :post_id => self.post_id})
    return @replies
  end
  def bit
    @bit = Bit.find_by_id(self.bit_id)
    return @bit
  end
end
