require 'faker'

Journey.destroy_all
Treehouse.destroy_all
User.destroy_all

users = []

lionel = User.create(email: 'lionel@mail.com', password: "123456")
amelie = User.create(email: 'amelie@mail.com', password: "123456")
anthony = User.create(email: 'anthony@mail.com', password: "123456")
amael = User.create(email: 'amael@mail.com', password: "123456")

[lionel, amelie, anthony, amael].each { |member| users << member }

categories = ["lake", "family", "romantic", "woods", "mountains", "fields"]
locations = ["rue du petit Barail 33300 Bordeaux",
              "59 rue roger Salengro 59000 Lille" ,
              "96 avenue de la soude 13009 Marseille",
              "12 rue de l ancien stade 10000 Troyes",
              "6 chemin de colmyr 74000 Annecy",
              "16 villa gaudelet 75011 Paris"
            ]

treehouses = [
  {
    image: "http://s3.amazonaws.com/supadu-travel-channel/silo/library/shows/treehouse%20guys.jpg",
    description: "This large house has a rustic look to it and is in poor condition.  The interior is done in wintery colors.  The yard is moderately-sized and is neatly-trimmed.  Also, rumor has it that a group of thieves used it as a meeting place.",
    title: "Château de Versailles"
  },
  {
    image: "https://gardenvillagebled.com/design/uploads/IMG_4647-25.jpg",
    description: "This moderately-sized house looks very modern and is in good condition.  The interior is done in autumn colors.  The yard is enormous and is overgrown with wild plants.",
    title: "Château de Castelnaud"
  },
  {
    image: "https://s-media-cache-ak0.pinimg.com/originals/d2/4d/d5/d24dd5f9ce9a9b49584a73a371a4fd62.jpg",
    description: "This moderately-sized house has a rustic look to it and is in average condition.  The interior is done in colors that remind you of the desert.  The yard is moderately-sized and is overgrown with wild plants.",
    title: "Château de Chenonceau"
  },
  {
    image: "https://i.pinimg.com/736x/24/fb/ea/24fbea340202e0aafe9fca685dfba80a--week-end-romantique-tree-houses.jpg",
    description: "This tiny house looks fairly modern and is in good condition.  The interior is done in colors that remind you of an orange tree.  The yard is enormous and resembles a meadow.  Also, it was once featured in a television special showcasing historical homes.",
    title: "Château de Villandry"
  },
  {
    image: "http://www.hotelroomsearch.net/im/hotels/lv/tree-house.jpg",
    description: "This small house has a futuristic look and is in good condition.  The interior is done in colors that remind you of a fruit salad.  The yard is tiny and is overgrown with wild plants.  Also, it has been empty for a long time.",
    title: "Château de Cheverny"
  },
  {
    image: "http://legault-dubois.ca/wp-content/uploads/2014/05/BALCON.jpg",
    description: "This tiny house looks very old-fashioned and is in good condition.  The interior is done in autumn colors.  The yard is moderately-sized and resembles a meadow.  Also, peopClaim to hear strange noises coming from the house at night.",
    title: "Château de Vaux-le-Vicomte"
  },
  {
    image: "http://meravigliapaper.com/wp-content/uploads/2013/03/0001a.jpg",
    description: "This large house has a rustic look to it and is in average condition.  The interior is done in dark colors.  The yard is small and is overgrown with wild plants.",
    title: "Château de Fontainebleau"
  },
  {
    image: "https://s-media-cache-ak0.pinimg.com/originals/0c/02/85/0c0285ae2ff4d28e0ba385c4fcf9be13.jpg",
    description: "From the outside this house looks warm and cozy. It has been built with tan stones and has burgandy brick decorations. Small, rounded windows brighten up the house and have been added to the house in a fairly asymmetrical pattern.",
    title: "Château de Saumur"
  },
  {
    image: "https://i.pinimg.com/736x/0a/74/98/0a7498b5bbc398567f1a05251694343f--backyard-designs-backyard-ideas.jpg",
    description: "The house is equipped with an old-fashioned kitchen and one small bathroom, it also has a generous living room, two bedrooms, a large dining room, an office and a roomy garage.",
    title: "Château de Peyrepertuse"
  },
  {
    image: "https://s-media-cache-ak0.pinimg.com/originals/92/52/b8/9252b8c36f2e50c041cae3b3d18968e9.jpg",
    description: "The roof is high, triangular, but one side is longer than the other and is covered with grey ceramic tiles. Two small chimneys sit at either side of the house. Several large windows let in plenty of light to the rooms below the roof. The house itself is surrounded by paved ground, with an outdoor eating and relaxing space and various potted plants.",
    title: "Château d’Ussé"
  },
  {
    image: "https://s-media-cache-ak0.pinimg.com/originals/76/75/2b/76752b17542a8269f6b5777dcb8006c0.jpg",
    description: "The roof is low and rounded and is covered with overlapping roof tiles. There are no chimneys. Two roof terraces let in plenty of light to the rooms below the roof. The house itself is surrounded by a modest garden, with mostly grass and a few small trees.",
    title: "Château d’Amboise"
  },
  {
    image: "https://s-media-cache-ak0.pinimg.com/originals/f2/04/13/f2041372ce86b6323af4d4cb7d75bd84.jpg",
    description: "The house is equipped with a huge kitchen and one small bathroom, it also has a fairly small living room, two bedrooms, a snug dining area and a roomy basement.",
    title: "Château des Ducs de Bretagne"
  },
  {
    image: "https://s-media-cache-ak0.pinimg.com/originals/87/0a/47/870a47ca9f61142ed0071eee93f1f387.jpg",
    description: "This enormous house looks very old-fashioned and is in good condition.  The interior is done in dark colors.  The yard is moderately-sized and resembles a meadow.",
    title: "Château de Valençaysjk"
  },
  {
    image: "http://www.itsmyhouse.net/wp-content/uploads/parser/tree-house-designs-for-adults-6.jpg",
    description: "This cramped, rectangular office has coordinating metal and plastic furniture.  The floor is carpeted and the walls are painted.  Light is provided by floor lamps and a ceiling light.  The room is done in colors that remind you of the night sky and overall has a cluttered look.",
    title: "Château de Chantilly"
  },
  {
    image: "http://blog.infotourisme.net/wp-content/uploads/2012/06/Dining-Pod.jpg",
    description: "This small house looks fairly modern and is in poor condition.  The interior is done in colors that remind you of a gingerbread house.  The yard is large and is neatly-trimmed.  Also, it's the site of an infamous murder.",
    title: "Château de Blois"
  },
]


treehouses.each do |treehouse|
  t = Treehouse.new(
    title: treehouse[:title],
    description: treehouse[:description],
    location: locations.sample,
    price_per_night: (40..200).to_a.sample,
    capacity: [2, 4].sample,
    category: categories.sample(3).join(" "),
    user: lionel)
  t.remote_photo_url = treehouse[:image]
  t.save
end

puts 'Seeds finished!'




