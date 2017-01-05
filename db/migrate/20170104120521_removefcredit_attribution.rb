class RemovefcreditAttribution < ActiveRecord::Migration
  def change
    remove_column :courses, :fcredit, :integer
  end
end
