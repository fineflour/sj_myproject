require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
     describe "#favorited(post)" do
       before do
       @user = create(:user)
       @post = create(:post)
       @comment = create(:comment, user: @user, post: @post)
     end

    it "returns 'nil' if the user has not favorited the post" do
      @favorited = @user.favorited(@post)
      expect(@favorited).to eq(nil)
   end
  
    it "returns the appropriate favorite if it exists" do
      expect(User.top_related).to eq([@user2, @user1])
    end

    it "shores a 'posts_count' on user" do
      users = User.top_related
      expect(users.first.posts_count).to eq(1)
    end

    it "stores a 'comments_count' on user" do
      users = User.top_rated
      expect(users.first.comments_count).to eq(2)
    end
 end
end
