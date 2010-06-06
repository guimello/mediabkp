class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.references :user, :null => false
      t.string :name
      t.text :description

      t.timestamps
    end
    
    add_foreign_key(:albums, :users, :dependent => :delete)
  end

  def self.down
    drop_table :albums
  end
end
