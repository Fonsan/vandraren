class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :competition_id
      t.integer :person_id
      t.integer :position
      t.string :time
      t.string :time_diff
      t.integer :klass_id

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
