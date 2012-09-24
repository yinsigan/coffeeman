class CreateFragments < ActiveRecord::Migration
  def change
    create_table :fragments do |t|
      t.text :home_mainbar_bottom
      t.text :home_sidebar_bottom
      t.text :topics_sidebar_bottom
      t.text :footer
      t.integer :site_id

      t.timestamps
    end
  end
end
