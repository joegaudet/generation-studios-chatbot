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

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it 'orders by created_at asc' do
    conversations = []
    conversations << FactoryBot.create(:conversation)
    sleep(0.1)
    conversations << FactoryBot.create(:conversation)
    sleep(0.1)
    conversations << FactoryBot.create(:conversation)
    sleep(0.1)
    expect(conversations).to eq(Conversation.all)
  end

  describe 'associations' do
    it { should belong_to(:account).class_name('Account') }
    it { should have_many(:messages).class_name('Message') }
  end

  describe 'validations' do
    it { should validate_presence_of(:account) }
  end
end
