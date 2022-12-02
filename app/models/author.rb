class Author < ApplicationRecord
    has_many :posts ,dependent: :destroy
    has_many :comments,dependent: :destroy
    has_many :likes,dependent: :destroy
    has_one_attached :image

def show_me
   Post.where(author_id: self.id).order(created_at: :desc).limit(3)
end
def postsC 
    self.postsCounter= Post.where(author_id: self.id).count
end

end
