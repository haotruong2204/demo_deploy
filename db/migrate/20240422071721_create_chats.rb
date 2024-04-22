class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.text :content
      t.integer :account_id
      t.integer :chat_room_id

      t.timestamps
    end
  end
end
