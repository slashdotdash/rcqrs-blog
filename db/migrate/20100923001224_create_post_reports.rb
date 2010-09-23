class CreatePostReports < ActiveRecord::Migration
  def self.up
    create_table :post_reports do |t|
      t.string :guid, :null => false, :length => 36
      t.string :title, :null => false
      t.text :raw_content, :null => false
      t.text :html_content, :null => false
      t.integer :comment_count, :default => 0, :null => false
      t.datetime :published_at
      t.timestamps
    end
    
    add_index :post_reports, :guid
    add_index :post_reports, :published_at
  end

  def self.down
    drop_table :post_reports
  end
end