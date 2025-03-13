class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.timestamps
      t.belongs_to :user, index: true
    end
  end
end
