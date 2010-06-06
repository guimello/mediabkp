class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.references :content, :null => false
      t.string :category, :null => false

      t.timestamps
    end
    
    add_foreign_key(:tags, :contents, :dependent => :delete)
  end

  def self.down
    drop_table :tags
  end
end
