# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  artist_id  :bigint           not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: {scope: :artist_id}
    validates :image_url, presence:true, uniqueness: true
    validates :title, :artist_id, presence: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artworks,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artworks,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy

    def self.artworks_for_user_id(idee)
        Artwork
        .select(:title, :artist_id, :image_url, :artwork_id)
        .joins(:artist)
        .joins(:shared_viewers)
        .group(:title, :artist_id, :image_url, :artwork_id) #if we want distinct titles with no repeats on views
        .where("artworks.artist_id = ? OR artwork_shares.viewer_id = ?", idee, idee)
    end


end
