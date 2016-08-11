class FirstSetup < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string :email
      t.timestamps
  	end

  	create_table :projects do |t|
      t.string :name
      t.timestamps
  	end

  	create_table :projects_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.string  :user_type
      t.boolean :primary_contact, default: false
      t.boolean :active, default: true
      t.timestamps
  	end
  end
end