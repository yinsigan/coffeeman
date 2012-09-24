class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :description
      t.string :twitter
      t.string :github
      t.string :website
      t.string :company
      t.integer :user_id

      t.timestamps
    end
  end
end
