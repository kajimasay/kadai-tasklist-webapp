class CreateJoblists < ActiveRecord::Migration[5.0]
  def change
    create_table :joblists do |t|
      t.string :content

      t.timestamps
    end
  end
end
