class CreateMedias < ActiveRecord::Migration
  def self.up
    create_table :medias do |t|
      t.references :album, :null => false
      t.string :title, :null => false
      t.string :type, :null => false
      t.text :description, :null => true

      t.timestamps
    end
    
    add_foreign_key(:medias, :albums, :dependent => :delete)
  end

  def self.down
    drop_table :medias
  end
end
