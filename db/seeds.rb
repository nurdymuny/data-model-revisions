# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{email: 'sample@sample.com'}, {email: 'sample@sample2.com'}, {email: 'sample@sample3.com'}, {email: 'sample@sample4.com'}]

User.create(users)

projects = [{name: 'project1'}, {name: 'project2'}, {name: 'project3'}]

Project.create(projects)

project_ids = Project.all.map(&:id)
User.all.map do |user|
  u = user.projects_users.build(project_id: project_ids.sample, user_type: ['Designer', 'Client', 'QueenBee', 'HoneyBee'].sample)
  u.save
end