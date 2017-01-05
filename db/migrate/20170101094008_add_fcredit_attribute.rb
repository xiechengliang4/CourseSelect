class AddFcreditAttribute < ActiveRecord::Migration
  def change
    add_column :courses, :fcredit, :float
  end
end
