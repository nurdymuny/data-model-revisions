class User < ActiveRecord::Base

  has_many :projects_users, class_name: 'ProjectUser'
  has_many :projects, through: :projects_users

end