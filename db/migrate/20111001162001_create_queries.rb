class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :user_name
      t.string :email
      t.text :question

      t.timestamps
    end
  end
end
