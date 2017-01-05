class AddFailAttribute < ActiveRecord::Migration
  def change
    add_column :grades,:fail,:boolean,default: false
  end
end
