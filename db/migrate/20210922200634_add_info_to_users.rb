class AddInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :info, :text
  end
end
