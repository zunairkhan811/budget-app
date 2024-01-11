require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com') }
  let(:group) { Group.create(name: 'Delicious Group', icon: 'group_icon_url', user:) }

  subject do
    described_class.new(
      name: 'Tasty Food',
      amount: 20.5,
      author: user,
      group_id: group.id
    )
  end

  describe 'validations' do
    it 'requires name to be present' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'requires amount to be present and greater than or equal to 0' do
      subject.amount = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:amount]).to include("can't be blank")

      subject.amount = -1
      expect(subject).to_not be_valid
      expect(subject.errors[:amount]).to include('must be greater than or equal to 0')
    end

    it 'requires group_id to be present' do
      subject.group_id = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:group_id]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'belongs to an author (User)' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq :belongs_to
      expect(association.class_name).to eq 'User'
    end

    it 'has many groups' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq :has_many
    end
  end
end
