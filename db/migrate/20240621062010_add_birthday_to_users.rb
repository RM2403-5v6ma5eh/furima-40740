class AddBirthdayToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birthday, :date, null: false  #,  default: '2000-01-01'
  end
end