class AddManagerRefToEmployee < ActiveRecord::Migration
  def change
    add_reference :employees, :manager, index: true
  end
end