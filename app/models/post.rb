class Post < ApplicationRecord
    belongs_to :author
    has_many :comments,dependent: :destroy
    has_many :likes,dependent: :destroy
    
    def likeC
        self.likesCounter= Like.where(post_id: self.id).count
   
    end
    def set_post
        @post= Post.where(id: 66, author_id: 9)
       end
    def showC
        @comments=Comment.where(post_id: self.id).limit(2)
    end

    def commentsCounter
       self.commentsCounter= Comment.where(post_id: self.id).count
     end
     def likesCount
        Like.where(post_id: self.id).count
     end
    
end
