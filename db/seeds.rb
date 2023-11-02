# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if County.all.length == 0
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

DiscussionChat.destroy_all