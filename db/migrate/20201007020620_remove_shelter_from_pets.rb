class RemoveShelterFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :shelter, :string
  end
end
