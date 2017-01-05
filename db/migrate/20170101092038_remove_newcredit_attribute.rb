class RemoveNewcreditAttribute < ActiveRecord::Migration
  def change
    remove_column :courses, :newcredit, :integer
  end
end
