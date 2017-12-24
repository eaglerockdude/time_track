require 'rails_helper'

# tests for navigation
describe 'feature - navigate' do
  # login before all tests
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
    @user2 = FactoryBot.create(:another_user)
    login_as(@user2, :scope => :another_user)
  end
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'contains a title that includes the word "Posts"' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
    it 'lists posts' do
      post1 = FactoryBot.build_stubbed(:post)
      post2 = FactoryBot.create(:another_post)
      visit posts_path
      expect(page).to have_content(/fb1|fb2/)
    end
  end
end

# tests for FORM post creation
describe 'Feature - Posts creation via a FORM' do

  before do
    user = User.create(email: 'test@gmail.com', first_name:'firstname', last_name:'lastname',password:'password', password_confirmation:'password')
    login_as(user, :scope=>:user)
    visit new_post_path
  end

  describe 'add new post' do
    it 'can be reached from the home/status page' do
      visit posts_path
      click_link 'New'
      expect(page.status_code).to eq(200)
    end
  end
  describe 'NEW Post create' do

    it 'ensures that the form route works with the /new action' do
      expect(page.status_code).to eq(200)
      expect(page.current_path).to eq(new_post_path)
    end

    it 'renders HTML in the /new template' do
      expect(page).to have_content('Post Form')
    end

    it "displays a new post form that redirects to the SHOW page after submit, which then contains the submitted post's title and description" do

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'rationale for overtime'
      click_on 'Submit Post'

      expect(page).to have_content(Date.today)
      expect(page).to have_content('rationale for overtime')
    end

    it 'a POST will have a USER associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'user is associated'
      click_on 'Submit Post'

      expect(User.last.posts.last.rationale).to eq('user is associated')
    end
  end
end

describe 'edit' do
  before do
    @post = FactoryBot.create(:post)
  end
  
  it 'can be reached from index page button' do
    visit posts_path
    click_link 'Edit'
    expect(page.status_code).to eq(200)
  end

  it 'can be edited' do
    visit edit_post_path(@post)
    fill_in 'post[date]', with: Date.today
    fill_in 'post[rationale]', with: "Edited content"
    click_on "Save"
    expect(page).to have_content("Edited content")
  end
end

describe 'Post#delete' do
  before do
    @post = FactoryBot.create(:post)
  end
  it 'can be deleted' do
    visit posts_path
    click_link("Delete")
    expect(page.status_code).to eq(200)
  end
end