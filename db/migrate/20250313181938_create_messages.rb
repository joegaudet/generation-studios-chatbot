class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_enum :message_type, ["human", "ai"]

    create_table :messages do |t|
      t.timestamps
      t.belongs_to :conversation, index: true
      t.enum :message_type, enum_type: 'message_type', null: false, default: 'human'
      t.text :body
    end
  end
end
