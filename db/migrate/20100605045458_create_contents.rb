class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.references :media, :null => false
      t.string :title, :null => false
      t.text :description, :null => true

      t.timestamps
    end
    
    add_foreign_key(:contents, :medias, :dependent => :delete)
  end

  def self.down
    drop_table :contents
  end
end
