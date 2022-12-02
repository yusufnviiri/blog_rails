class Like < ApplicationRecord
    belongs_to :author
    belongs_to :post
    validates :author_id,uniqueness: true
end
