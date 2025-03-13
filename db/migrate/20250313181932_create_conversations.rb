class CreateConversations < ActiveRecord::Migration[8.0]
  def change
    create_table :conversations do |t|
      t.timestamps
      t.belongs_to :account, index: true
    end
  end
end
