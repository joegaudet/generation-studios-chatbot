# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact    :jsonb            not null
#

class User < ApplicationRecord
  # TODO: Add Value attribute for contact information
  # TODO: Add validations
  has_one :account
  validates :email, presence: true, uniqueness: true
end
