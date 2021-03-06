class CreateTeacherHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_holidays do |t|
      t.belongs_to :teacher, index: true
      t.int8range :holiday_date_range
      t.string :description
      t.string :teacher_timezone
      t.timestamps null: false
    end
  end
end
