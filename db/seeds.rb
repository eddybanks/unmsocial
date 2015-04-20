# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create!(
            username: "eddybanks",
            fname: "Edwin",
            lname: "Agbenyega",
            gender: "Male",
            email: "eddybanks@unm.edu",
            admin: true
)

first_comment = Faqcomment.create!(
            comment: "Feel free to leave constructive comments and questions. Check out the FAQs before asking questions!"
)
