module TestFactories

  def associated_post(options={})
    post_options = {
      title: 'Post title',
      body: 'Post bodies are pretty damn long!',
      topic: Topic.create(name: 'Topic name'),
      user: authenticated_user
    }.merge(options)
    Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  def vote_presteps
    request.env["HTTP_REFERER"] = '/'
    @user = authenticated_user
    @post = associated_post
    sign_in @user
  end

  def comment_without_email
     
  end
end
