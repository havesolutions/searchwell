class AddMailSentToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :mail_sent, :boolean, :default => false
  end
end

