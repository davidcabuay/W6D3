# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    validates :author_id, :artwork_id, :body, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    def self.comment_for_artwork_id(id)
        Comment
        .select(:artwork_id, :author_id, :body)
        .where('artwork_id = ?', id)
    end

    def self.comment_for_user_id(id)
        Comment
        .select(:artwork_id, :author_id, :body)
        .where('author_id = ?', id)
    end
end
