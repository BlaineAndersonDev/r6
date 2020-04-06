class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.integer :zip
      t.integer :c_high
      t.integer :c_low
      t.integer :c_current
      t.integer :c_average
      t.integer :f_high
      t.integer :f_low
      t.integer :f_current
      t.integer :f_average

      t.timestamps
    end
  end
end
