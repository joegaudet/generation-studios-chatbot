# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

def seed_conversation(account)
  conversation = account.conversations.create!
  conversation.messages.create(message_type: :human, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :ai, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :human, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :ai, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :human, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :ai, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :human, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :ai, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :human, body: Faker::Lorem.sentence)
  conversation.messages.create(message_type: :ai, body: Faker::Lorem.sentence)
end

def seed_user(user)
  account = user.create_account
  (1..rand(5)).each do
    seed_conversation(account)
  end
end

seed_user(FactoryBot.create(:user))
seed_user(FactoryBot.create(:user))
seed_user(FactoryBot.create(:user))
seed_user(FactoryBot.create(:user))
seed_user(FactoryBot.create(:user))
