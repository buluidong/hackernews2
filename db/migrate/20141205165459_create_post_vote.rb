class CreatePostVote < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.integer :voted
      t.timestamps
    end
  end
end
