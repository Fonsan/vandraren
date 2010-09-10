class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.date :birthdate
      t.string :name
      t.string :surname
      t.integer :person_id

      t.timestamps
    end


    add_index :people,:birthdate
  end

  def self.down
    drop_table :people
  end
end
