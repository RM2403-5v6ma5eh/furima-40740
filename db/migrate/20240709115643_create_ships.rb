class CreateShips < ActiveRecord::Migration[7.0]
  def changestreet_address
    create_table :ships do |t|
      t.string     :post_code,              null:  false
      t.integer    :region_id,              null:  false     
      t.string     :municipality,           null:  false  
      t.string     :street_address,         null:  false
      t.string     :build_name            
      t.string     :phone_num,              null:  false
      t.references :order,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end


