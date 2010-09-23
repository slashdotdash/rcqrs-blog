class CreatePostReports < ActiveRecord::Migration
  def self.up
    create_table :post_reports do |t|
      t.string :guid, :null => false, :length => 36
      t.string :title, :null => false
      t.text :raw_content, :null => false
      t.text :html_content, :null => false
      t.integer :comment_count, :default => 0, :null => false
      t.integer :year, :null => false
      t.integer :month, :null => false
      t.integer :day, :null => false
      t.string :slug, :null => false
      t.datetime :published_at
      t.timestamps
    end
    
    add_index :post_reports, :guid
    add_index :post_reports, :published_at
    add_index :post_reports, [:year, :month, :day, :slug]
  end

  def self.down
    drop_table :post_reports
  end
end