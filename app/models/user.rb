class User < ApplicationRecord

  has_many :posts
  has_many :comments

   
   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def upvotes

    i = 0
    self.posts.each do |post|

      i += post.upvote
      
    end

    self.comments.each do |comment|

      i += comment.upvote
      
    end
    i

  end

end
