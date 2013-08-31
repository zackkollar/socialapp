class Bit < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts ,  dependent: :destroy, order: 'created_at DESC'
  has_many :follows, dependent: :destroy
  has_one :profile,  dependent: :destroy
  
  accepts_nested_attributes_for :posts, :follows, :profile
  
  scope :recent_posts, -> { where({:order=>'id desc'}).last(10) }
  
  after_create :setup_profile
  
  def following_posts
    # Check if the user is logged in.
    # Grab the followers and make an empty array
    @followers = self.follows
    @posts = []
    # For each follow that the query returns, add the users posts to the array.
    @followers.each do |f|
      @posts.push f.get_posts
    end
    @posts.push self.posts
    # Strip off the non-sense so that we can render cleanly
    # Also order the posts by date
    sorted = @posts.flatten(1).sort_by &:created_at
    return sorted
  end
  
  private
  # After the user is created, create a profile for the user.
  def setup_profile
    @profile = Profile.new({:bit_id => self.id})
    @profile.save()
  end
  
end
