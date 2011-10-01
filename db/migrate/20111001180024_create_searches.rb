class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.text :query_description
      t.string :email

      t.timestamps
    end
  end
end
