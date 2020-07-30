class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.integer :pruid
      t.string :prname
      t.string :prnameFR
      t.date :date
      t.integer :numconf
      t.integer :numprob
      t.integer :numdeaths
      t.integer :numtotal
      t.integer :numtested
      t.integer :numrecover
      t.decimal :percentrecover, precision: 6, scale: 2
      t.integer :ratetested
      t.integer :numtoday
      t.decimal :percentoday, precision: 6, scale: 2
      t.decimal :ratetotal, precision: 6, scale: 2
      t.decimal :ratedeaths, precision: 4, scale: 2
      t.integer :deathstoday
      t.decimal :percentdeath, precision: 6, scale: 2
      t.integer :testedtoday
      t.integer :recoveredtoday
      t.decimal :percentactive, precision: 6, scale: 2
      t.integer :numactive
      t.decimal :rateactive, precision: 6, scale: 2
      t.integer :numtotal_last14
      t.decimal :ratetotal_last14, precision: 6, scale: 2
      t.integer :numdeaths_last14
      t.decimal :ratedeaths_last14, precision: 4, scale: 2

      t.timestamps
    end
    add_index :provinces, [:pruid, :prname, :prnameFR]
  end
end
