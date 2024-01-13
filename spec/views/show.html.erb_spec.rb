require 'rails_helper'

RSpec.describe 'Groups Show Page', type: :system do
  let(:user1) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password')
  end
  let!(:group1) { Group.create(name: 'Delicious Group', icon: 'icon_url_1', user: user1) }
  let!(:food1) { Food.create(name: 'Tasty Food 1', amount: 20.5, author_id: user1.id, group_id: group1.id) }

  before do
    login_as(user1, scope: :user)
    visit group_path(group1)
  end

  it 'displays details of the group and its foods' do
    expect(page).to have_content('Delicious Group')
    expect(page).to have_content("$#{group1.foods.sum(:amount)}")
    expect(page).to have_content(food1.name)
  end

  it 'allows editing the group' do
    click_link('Edit')
    expect(page).to have_content('Update Restaurant')
  end

  it 'displays details of the foods in the group' do
    within('.food-container') do
      expect(page).to have_content(food1.name)
    end
  end

  it 'allows adding a new food to the group' do
    within('.my-footer') do
      expect(page).to have_link('Add new Food')
    end
  end
end
