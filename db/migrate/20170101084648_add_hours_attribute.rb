class AddHoursAttribute < ActiveRecord::Migration
  def change
    add_column :courses, :hours, :integer
  end 
end
