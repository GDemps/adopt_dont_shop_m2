class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :applicant
      t.string :address
      t.string :description
      t.string :application_status
    end
  end
end
