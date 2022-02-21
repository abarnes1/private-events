class AddStatusToEventAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :event_attendance, :attendance_status, :integer, null: false
    add_index :event_attendance, :attendance_status
  end
end
