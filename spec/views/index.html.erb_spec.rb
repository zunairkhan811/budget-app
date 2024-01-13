# spec/system/groups_index_spec.rb
require 'rails_helper'

RSpec.describe 'Groups Index Page', type: :system do
  let(:user1) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password',
                password_confirmation: 'password')
  end

  let!(:group1) do
    Group.create(name: 'Delicious Group 1', icon: 'icon_url_1', user_id: user1.id)
  end

  before do
    login_as(user1, scope: :user)
    visit groups_path
  end

  it 'displays details of each group that the user can read' do
    within('.restaurant-card-container') do
      expect(page).to have_link(group1.name, href: group_path(group1))
    end
  end

  it 'displays the "Add new Restaurant" button' do
    within('.my-footer') do
      expect(page).to have_link('Add new Restaurant', href: new_group_path)
    end
  end

  it 'does not display details of groups that the user cannot read' do
    other_user = User.create(name: 'Other User', email: 'other@example.com', password: 'password',
                             password_confirmation: 'password')
    other_group = Group.create(name: 'Other Group', icon: 'other_icon_url', user: other_user)

    visit groups_path

    within('.restaurant-card-container') do
      expect(page).not_to have_link(other_group.name, href: group_path(other_group))
    end
  end
end
