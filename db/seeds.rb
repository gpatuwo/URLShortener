# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "sample1@gmail.com")
User.create(email: "sample2@gmail.com")
User.create(email: "sample3@gmail.com")
User.create(email: "sample4@gmail.com")
User.create(email: "sample5@gmail.com")
User.create(email: "sample6@gmail.com")

ShortenedUrl.create_for_user_and_long_url!(User.all[0], "http://www.google.com")
ShortenedUrl.create_for_user_and_long_url!(User.all[0], "http://www.google.com")
ShortenedUrl.create_for_user_and_long_url!(User.all[0], "http://www.google.com")
ShortenedUrl.create_for_user_and_long_url!(User.all[1], "http://www.google.com")
ShortenedUrl.create_for_user_and_long_url!(User.all[2], "http://www.google.com")
ShortenedUrl.create_for_user_and_long_url!(User.all[3], "http://www.google.com")
ShortenedUrl.create_for_user_and_long_url!(User.all[4], "http://www.google.com")

Visit.record_visit!(User.all[0], ShortenedUrl.all[0])
Visit.record_visit!(User.all[0], ShortenedUrl.all[0])
Visit.record_visit!(User.all[1], ShortenedUrl.all[0])
Visit.record_visit!(User.all[1], ShortenedUrl.all[1])
Visit.record_visit!(User.all[2], ShortenedUrl.all[1])
Visit.record_visit!(User.all[3], ShortenedUrl.all[2])
Visit.record_visit!(User.all[3], ShortenedUrl.all[2])


# Site 0, Visit 3, unique 2
# Site 1, Visit 2, unique 2
# Site 2, Visit 2, unique 1
