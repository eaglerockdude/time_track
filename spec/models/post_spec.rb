require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Posts' do
    before do
      @post = Post.new(date: '16/09/2017', rationale:'a lot of work')
    end
    it 'can be created' do
      expect(@post).to be_valid
    end
    it 'date and rationale - model validates presence' do
      expect(@post).to be_valid
    end
  end
end
