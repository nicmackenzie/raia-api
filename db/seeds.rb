# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding database..."
# user1 = User.create(name:"John",role:"Doctor")
# user2 = User.create(name:"Jack",role:"Chief")
# user3 = User.create(name:"Eustus",role:"Developer")
# discussion1 = Discussion.create(title:"Climate change",content:"The weather patterns recently have drastically changed",user_id:1,is_deleted:false)
# discussion2 = Discussion.create(title:"Roads status",content:"The roads built about 10 years back are in very poor condition at the moment",user_id:2,is_deleted:false)
# discussion3 = Discussion.create(title:"Networking opportunities",content:"there are very few networking seminars for the youth",user_id:3,is_deleted:false)
# discussion_rep = DiscussionReply.create(discussion_id:1,user_id:1,content:"Yes i agree for example in Rongai it has been extremely cold the past week which is very rare",upvotes:2)
# discussion_rep2 = DiscussionReply.create(discussion_id:2,user_id:2,content:"For my case i cant even see a tarmac road anymore its all dust",upvotes:3)
# discussion_rep3 = DiscussionReply.create(discussion_id:3,user_id:3,content:"I am seeking individuals who are as into tech as I am but it is proving difficult",upvotes:2)

review1 = Review.create(content:"could do better in terms of engagement with citizens",rating:3.5,user_id:2)
review1 = Review.create(content:"Really seen a significant improvement",rating:4.5,user_id:3)
review1 = Review.create(content:"No dedication whatsoever to their work",rating:1.5,user_id:1)
puts "Done seeding"if County.all.length == 0
    puts "Seeding counties...."
    County.create([{ name: 'Mombasa' },{ name: 'Kwale' },{ name: 'Kilifi' },{ name: 'Tana River' },{ name: 'Lamu' },
    { name: 'Taita-Taveta' },{ name: 'Garissa' },{ name: 'Wajir' },{ name: 'Mandera' },{ name: 'Marsabit' },
    { name: 'Isiolo' },{ name: 'Meru' },{ name: 'Tharaka-Nithi' },{ name: 'Embu' },{ name: 'Kitui' },
    { name: 'Machakos' },{ name: 'Makueni' },{ name: 'Nyandarua' },{ name: 'Nyeri' },{ name: 'Kirinyaga' },
    { name: 'Murang\'a' },{ name: 'Kiambu' },{ name: 'Turkana' },{ name: 'West Pokot' },{ name: 'Samburu' },
    { name: 'Trans-Nzoia' },{ name: 'Uasin Gishu' },{ name: 'Elgeyo-Marakwet' },{ name: 'Nandi' },
    { name: 'Baringo' },{ name: 'Laikipia' },{ name: 'Nakuru' },{ name: 'Narok' },{ name: 'Kajiado' },
    { name: 'Kericho' },{ name: 'Bomet' },{ name: 'Kakamega' },{ name: 'Vihiga' },{ name: 'Bungoma' },
    { name: 'Busia' },{ name: 'Siaya' },{ name: 'Kisumu' },{ name: 'Homa Bay' },{ name: 'Migori' },
    { name: 'Kisii' },{ name: 'Nyamira' },{ name: 'Nairobi' }])
    puts "Counties seeded!"
end