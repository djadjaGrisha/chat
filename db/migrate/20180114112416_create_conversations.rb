class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.string :topic
      t.references :user, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :conversations, :deleted_at
  end
end
