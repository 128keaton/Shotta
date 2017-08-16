class CreateScreenshots < ActiveRecord::Migration[5.0]
  def change
    create_table :screenshots do |t|
      t.string :image
      t.datetime :created_at, null: false
    end
  end
end
