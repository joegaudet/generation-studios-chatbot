# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact    :jsonb            not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:account).class_name('Account') }
  end

  describe 'validations' do
    it 'email is present' do
      FactoryBot.build(:user).save!
      expect {
        FactoryBot.create(:user, email: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is unique on email address' do
      user1 = FactoryBot.create(:user)
      expect {
        FactoryBot.create(:user, email: user1.email)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
