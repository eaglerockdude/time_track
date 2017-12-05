require 'rails_helper'

# tests for navigation
describe 'feature - navigate' do
  # login before all tests
  before do
    user = User.create(email: 'test@gmail.com', first_name:'firstname', last_name:'lastname',password:'password', password_confirmation:'password')
    login_as(user, :scope=>:user)
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
      post1 = Post.create(date: Date.today, rationale: "Post1")
      post2 = Post.create(date: Date.today, rationale: "Post2")
      visit posts_path
      #byebug
      expect(page).to have_content(/'Post1'|'Post2'/)
      
    end
    
  end
  end

# tests for FORM post creation
describe 'Feature - Posts creation via a FORM'  do

  before do
    user = User.create(email: 'test@gmail.com', first_name:'firstname', last_name:'lastname',password:'password', password_confirmation:'password')
    login_as(user, :scope=>:user)
    visit new_post_path
  end
  
  describe 'NEW Post create' do

    it 'ensures that the form route works with the /new action' do
      expect(page.status_code).to eq(200)
      expect(page.current_path).to eq(new_post_path)
    end

    it 'renders HTML in the /new template' do
      expect(page).to have_content('Post Form')
    end

     # We want to display a form, fill it in, submit it, and redirect to our SHOW page.
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

  # TODO  ------------------
    it 'the new template contains a form with fields for a Post' do
      visit new_post_path
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'rational for overtime'
      click_on 'Submit Post'
    end

  end
end
