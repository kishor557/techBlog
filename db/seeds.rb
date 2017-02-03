# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.first

u.blogs.create({title: "Blog title 1", content: "Blog content 1", tags_list: "tag1,tag2"})
u.blogs.create({title: "Blog title 2", content: "Blog content 2", tags_list: "tag3,tag4"})
u.blogs.create({title: "Blog title 3", content: "Blog content 3", tags_list: "tag3,tag2"})
u.blogs.create({title: "Blog title 4", content: "Blog content 4", tags_list: "tag1,tag4"})
