class AddMainClassToKlass < ActiveRecord::Migration
  def self.up
    add_column :klasses, :main_class, :boolean, :default => false,  :null => false
  end

  def self.down
    remove_column :klasses, :main_class
  end
end
