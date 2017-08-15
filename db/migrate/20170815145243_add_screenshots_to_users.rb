class AddScreenshotsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :screenshots, :json
  end
end
