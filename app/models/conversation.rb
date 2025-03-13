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

class Conversation < ApplicationRecord
  belongs_to :account
  has_many :messages, dependent: :destroy

  validates :account, presence: true
end
