class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :eventID
      t.string :eventName
      t.text :eventDescription
      t.string :eventImage
      t.string :eventUsers

      t.timestamps
    end
  end
end
