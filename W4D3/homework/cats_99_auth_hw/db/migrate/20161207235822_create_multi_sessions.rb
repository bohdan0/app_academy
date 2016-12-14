class CreateMultiSessions < ActiveRecord::Migration
  def change
    create_table :multi_sessions do |t|
      t.integer :user_id, null: false
      t.string :session_token, null: false
      t.timestamps null: false
      t.timestamps null: false
    end
    add_index :multi_sessions, :user_id
  end
end
