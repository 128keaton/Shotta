class AddUserIdToScreenshot < ActiveRecord::Migration[5.0]
  def change
    add_column :screenshots, :user_id, :integer
  end
end
