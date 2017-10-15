class AddUserIdToJoblists < ActiveRecord::Migration[5.0]
  def change
    add_column :joblists, :user_id, :string
  end
end
