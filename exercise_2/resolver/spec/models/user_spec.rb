# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:active_relationships).class_name('Relationship').dependent(:destroy) }
    it { is_expected.to have_many(:passive_relationships).class_name('Relationship').dependent(:destroy) }
  end

  describe 'validate' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
  end
end
