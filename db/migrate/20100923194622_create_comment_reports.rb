class CreateCommentReports < ActiveRecord::Migration
  def self.up
    create_table :comment_reports do |t|
      t.string :guid
      t.string :post_id
      t.string :post_title
      t.string :author
      t.string :email
      t.string :website
      t.text :comment
      t.datetime :approved_at
      t.timestamps
    end
    
    add_index :comment_reports, :guid
    add_index :comment_reports, :post_id
    add_index :comment_reports, [:post_id, :approved_at]
  end

  def self.down
    drop_table :comment_reports
  end
end