# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :integer
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#

require 'rails_helper'

RSpec.describe Message, type: :model do

  it 'orders by created_at asc' do
    messages = []
    messages << FactoryBot.create(:message, :ai)
    sleep(0.1)
    messages << FactoryBot.create(:message, :ai)
    sleep(0.1)
    messages << FactoryBot.create(:message, :ai)
    sleep(0.1)
    expect(messages).to eq(Message.all)
  end


  describe 'associations' do
    it { should belong_to(:conversation).class_name('Conversation') }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:conversation) }
  end

  describe 'message_types' do

    let!(:human_messages) {
      [
        FactoryBot.create(:message, :human),
        FactoryBot.create(:message, :human)
      ]
    }
    let!(:ai_messages) {
      [
        FactoryBot.create(:message, :ai),
        FactoryBot.create(:message, :ai),
        FactoryBot.create(:message, :ai),
      ]
    }

    it 'selects human messages' do
      human = Message.human
      expect(human).to have_attributes(length: 2)
      expect(human).to match_array(human_messages)
    end

    it 'selects ai messages' do
      ai = Message.ai
      expect(ai).to have_attributes(length: 3)
      expect(ai).to match_array(ai_messages)
    end
  end
end