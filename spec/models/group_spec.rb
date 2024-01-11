require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com') }

  subject do
    described_class.new(
      name: 'Delicious Recipe',
      icon: 'icon_url_here',
      user: user
    )
  end

  describe 'validations' do
    it 'requires name to be present' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it 'requires icon to be present' do
      subject.icon = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:icon]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end
end
