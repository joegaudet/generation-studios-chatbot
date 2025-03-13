class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :email, null: false, index: { unique: true }
      t.jsonb :contact, null: false, default: {}
    end
  end
end
