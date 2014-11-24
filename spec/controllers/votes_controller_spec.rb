 require 'rails_helper'

  #include TestFactories

    include Devise::TestHelpers

 describe VotesController do

   describe '#up_vote' do
     it "adds an up-vote to the post" do
       request.env["HTTP_REFERER"] = "/"
       @user = create(:user)
       sign_in @user
       post = create(:post)
       expect {
         post( :up_vote, post_id: post.id, topic_id: post.topic_id )
       }.to change{ post.up_votes }.by 1
     end
   end

     describe '#down_vote' do
       it "adds a down-vote to the post" do
         request.env["HTTP_REFERER"] = "/"
         @user = create(:user)
         sign_in @user
         post = create(:post)
         expect {
           post( :down_vote, post_id: post.id, topic_id: post.topic_id )
         }.to change{ post.down_votes }.by 1
       end
   end
 end
