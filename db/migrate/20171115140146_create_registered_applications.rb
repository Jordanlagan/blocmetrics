class CreateRegisteredApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :registered_applications do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
