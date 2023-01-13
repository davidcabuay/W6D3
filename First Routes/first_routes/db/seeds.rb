# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')

user1 = User.create(username: "Stephen")
user2 = User.create(username: "Aaron")
user3 = User.create(username: "Kenny")
user4 = User.create(username: "Edward")
user5 = User.create(username: "Claus")
user6 = User.create(username: "Omar")
user7 = User.create(username: "Paolo")
user8 = User.create(username: "Cesar")
user9 = User.create(username: "David")

artwork1 = Artwork.create(title: "Mono Lizzo", artist_id: user1.id, image_url: "www.stephen.com/MonoLizzo")
artwork2 = Artwork.create(title: "Santa Claus", artist_id: user1.id, image_url: "www.stephen.com/SantaClaus")
artwork3 = Artwork.create(title: "Zoids x Beyblade", artist_id: user3.id, image_url: "www.kenny.com/ZoidsXBeyblade")
artwork4 = Artwork.create(title: "The Alps", artist_id: user4.id, image_url: "www.edward.com/TheAlps")
artwork5 = Artwork.create(title: "White Christmas", artist_id: user5.id, image_url: "www.claus.com/WhiteChristmas")
artwork6 = Artwork.create(title: "Poco Loco", artist_id: user6.id, image_url: "www.paolo.com/PocoLoco")
artwork7 = Artwork.create(title: "Call of Duty", artist_id: user7.id, image_url: "www.omar.com/CallofDuty")
artwork8 = Artwork.create(title: "Tequila Sunrise", artist_id: user8.id, image_url: "www.cesar.com/TequilaSunrise")
artwork9 = Artwork.create(title: "All Red", artist_id: user9.id, image_url: "www.david.com/AllRed")
artwork10 = Artwork.create(title: "Mono Lizzo", artist_id: user2.id, image_url: "www.aaron.com/MonoLizzo")

share1 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user5.id)
share2 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: user5.id)
share3 = ArtworkShare.create(artwork_id: artwork7.id, viewer_id: user3.id)
share4 = ArtworkShare.create(artwork_id: artwork8.id, viewer_id: user7.id)
share5 = ArtworkShare.create(artwork_id: artwork6.id, viewer_id: user8.id)
share6 = ArtworkShare.create(artwork_id: artwork4.id, viewer_id: user2.id)
share7 = ArtworkShare.create(artwork_id: artwork9.id, viewer_id: user1.id)
share8 = ArtworkShare.create(artwork_id: artwork8.id, viewer_id: user6.id)
share9 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user9.id)
share10 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)



