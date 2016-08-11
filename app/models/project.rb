class Project < ActiveRecord::Base

	has_many :projects_users, class_name: 'ProjectUser'
	has_many :users, through: :projects_users

  #rails 4
  has_many :designers, -> {where(projects_users: {user_type: "Designer"})}, 
           source: :user, 
           through: :projects_users

  has_many :ex_designers, -> {where(projects_users: {user_type: 'Designer', active: false})},
           source: :user,
           through: :projects_users

  #clients relationship
  has_many :clients, -> {where(projects_users: {user_type: "Client"})}, 
           source: :user,
           through: :projects_users  

  #queenbee relationship
  has_many :queen_bees, -> {where(projects_users: {user_type: 'QueenBee'})},
           source: :user,
           through: :projects_users

  #honeybee
  has_many :honey_bees, -> {where(projects_users: {user_type: 'HoneyBee'})},
           source: :user,
           through: :projects_users

  #rails 3
  # has_many :designers, {
  #   through: :projects_users,
  #   source: :user,
  #   conditions: {
  #     "projects_users": {user_type: 'Designer'}
  #   }
  # }

  def client_primary_contact
    clients.where(projects_users: {primary_contact: true}).first
  end
end