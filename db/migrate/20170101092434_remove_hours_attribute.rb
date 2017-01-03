class RemoveHoursAttribute < ActiveRecord::Migration
  def change
    remove_column :courses, :hours, :integer
  end
end
