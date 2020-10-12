class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
    end
  end
end
