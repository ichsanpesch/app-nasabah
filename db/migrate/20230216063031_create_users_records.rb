class CreateUsersRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :users_records do |t|

      t.timestamps
    end
  end
end
