class CreateEventAttendance < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendance do |t|
      t.timestamps
    end

    add_reference :event_attendance, :attended_event, foreign_key: { to_table: :events }, null: false
    add_reference :event_attendance, :attendee, foreign_key: { to_table: :users }, null: false
  end
end
