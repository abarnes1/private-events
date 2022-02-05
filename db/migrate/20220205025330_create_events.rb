class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.name :string
      t.location :string
      t.date :date

      t.timestamps
    end
  end
end
