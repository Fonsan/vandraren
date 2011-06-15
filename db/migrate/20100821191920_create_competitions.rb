class CreateCompetitions < ActiveRecord::Migration
  def self.up
    create_table :competitions do |t|
      t.string :name
      t.text :comment
      t.date :date
      t.integer :competition_id
      t.string :url

      t.timestamps
    end
    add_index :competitions,:date
  end

  def self.down
    drop_table :competitions
  end
end
