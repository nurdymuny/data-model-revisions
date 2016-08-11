class ProjectUser < ActiveRecord::Base
	self.table_name = "projects_users"

	belongs_to :project
	belongs_to :user

	validates :project_id, presence: true, uniqueness: {
		scope: [:user_id, :user_type],
		message: "already associated with the Client"
	}

	validates :user_id, presence: true
	validates :primary_contact, inclusion: {
		in: [true, false],
		message: 'must be either true or false'
		}, if: :is_project_client?

	validates :active, inclusion: {
		in: [true, false],
			message: 'must be either true or false'
	}

	def is_project_client?
		user_type.eql?('Client')
	end
end