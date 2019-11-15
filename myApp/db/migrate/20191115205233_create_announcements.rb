class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :announcementTitle
      t.text :announcementText

      t.timestamps
    end
  end
end
