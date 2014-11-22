require 'rails_helper'

  describe "Visiting profiles" do

    include TestFactories

    include Warden::Test::Helpers
    Warden.test_mode!

  before do

    @user = authenticated_user
    login_as (@user)
    @post = associated_post(user: @user)
    @comment = Comment.new(user: @user, body: "Yes! This is a comment for the Ages!")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save
  end

  describe "signed in" do

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end
  end
end
