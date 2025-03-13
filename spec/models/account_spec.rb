# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:conversations).class_name('Conversation') }
  end

  describe 'validations' do
    it 'account_is_present' do
      FactoryBot.build(:account).save!
      expect {
        FactoryBot.create(:account, user: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
