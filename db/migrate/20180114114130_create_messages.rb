class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :messages, :deleted_at
  end
end
