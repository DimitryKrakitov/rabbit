class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|


      t.belongs_to :post, null: false
      t.belongs_to :user, null: false
      t.string :body, null: false
      t.integer :upvote, null: false, default: 0
      t.integer :downvote, null: false, default: 0

      t.timestamps
    end
  end
end
