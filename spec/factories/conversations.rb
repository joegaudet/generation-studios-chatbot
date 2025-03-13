# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#
# Indexes
#
#  index_conversations_on_account_id  (account_id)
#

FactoryBot.define do
  factory :conversation do
    association :account
  end
end
