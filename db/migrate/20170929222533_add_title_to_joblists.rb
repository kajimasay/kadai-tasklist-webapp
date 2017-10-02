class AddTitleToJoblists < ActiveRecord::Migration[5.0]
  def change
    add_column :joblists, :status, :string
  end
end

