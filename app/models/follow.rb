class Follow < ActiveRecord::Base
  belongs_to :bit
  
  def get_posts
    @posts = Bit.find_by_id(self.follow_id).posts
    return @posts
  end
end
