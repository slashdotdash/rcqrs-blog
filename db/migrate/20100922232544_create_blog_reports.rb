class CreateBlogReports < ActiveRecord::Migration
  def self.up
    create_table :blog_reports do |t|
      t.string :guid, :null => false, :length => 36
      t.string :name, :null => false
      t.string :tagline, :null => false
      t.timestamps
    end
    
    add_index :blog_reports, :guid
  end

  def self.down
    drop_table :blog_reports
  end
end