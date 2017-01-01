class AddNewcreditAttribute < ActiveRecord::Migration
  def change
    add_column :courses, :newcredit, :integer
  end
end
