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

class Message < ApplicationRecord
  default_scope { order(created_at: :asc) }
  attribute :message_type, :string
  enum :message_type, { human: 'human', ai: 'ai' }
  belongs_to :conversation
  has_many_attached :images

  validates :conversation, presence: true
  validates :body, presence: true
end
