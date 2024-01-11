require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', email: 'tom@gmail.com') }
  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end