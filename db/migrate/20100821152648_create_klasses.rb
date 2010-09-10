class CreateKlasses < ActiveRecord::Migration
  def self.up
    create_table :klasses do |t|
      t.string :short_name
      t.string :name

      t.timestamps
    end

    add_index(:klasses, :short_name)
  end

  def self.down
    drop_table :klasses
  end
end
