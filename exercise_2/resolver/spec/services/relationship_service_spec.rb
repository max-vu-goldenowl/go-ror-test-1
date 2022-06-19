require 'rails_helper'

RSpec.describe RelationshipService do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe '#follow' do
    it 'Should be user follows another user' do
      expect { described_class.follow(user, other_user) }.to change(Relationship, :count).by(1)
    end

    it 'Should be raised ActiveRecord::RecordInvalid' do
      expect { described_class.follow(user, FactoryBot.build(:user)) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#unfollow!' do
    before { Relationship.create(follower: user, followed: other_user) }

    it 'Should be user unfollows another user' do
      expect { described_class.unfollow!(user, other_user) }.to change(Relationship, :count).by(-1)
    end
  end

  describe 'following?' do
    context 'should be not nil' do
      before { Relationship.create(follower: user, followed: other_user) }
      it { expect(described_class.following?(user, other_user)).not_to be_nil }
    end

    context 'should be nil' do
      it { expect(described_class.following?(user, other_user)).to be_nil }
    end
  end
end
