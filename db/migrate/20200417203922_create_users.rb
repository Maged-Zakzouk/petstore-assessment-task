class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :integer do |t|
      t.string     :username
      t.string     :first_name
      t.string     :last_name
      t.string     :phone
      t.string     :email
      t.string     :password
      t.integer    :user_status

      t.timestamps
    end
  end
end
