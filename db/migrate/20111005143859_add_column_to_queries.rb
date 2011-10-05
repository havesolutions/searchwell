class AddColumnToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :is_solved, :boolean, :default => false
    add_column :queries, :solved_by, :integer, :default => nil
    add_column :queries, :solved_at, :datetime
    add_column :queries, :solution, :text
  end
end

