# Admin routes
# Post routes

before do
  puts '[Params]'
  p params
end

get "/admin/posts/new" do
  @title = "New Post"
  @post = Post.new
  haml :"admin/posts/new"
end

get "/admin/posts" do
  @posts = Post.order("created_at DESC")
  haml :"admin/posts/index"
end

post "/admin/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "/admin/posts"
  else
    haml :"admin/posts/new"
  end
end

get "/admin/posts/:id/edit" do
  @post = Post.find(params[:id])
  @title = "Edit Form"
  haml :"admin/posts/edit"
end

put "/admin/posts/:id" do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect "/admin/posts"
  else
    haml :"admin/posts/edit"
  end
end
 
delete "/admin/posts/:id" do
  @post = Post.find(params[:id]).destroy
  redirect "/"
end

# category routes
get "/admin/categories/new" do
  @title = "New Cateogry"
  @category = Category.new
  haml :"admin/categories/new"
end

get "/admin/categories" do
  @category = Category.order("created_at DESC")
  haml :"admin/categories/index"
end

post "/admin/categories" do
  @category = Category.new(params[:category])
  if @category.save
    redirect "/admin/categories"
  else
    haml :"admin/categories/new"
  end
end

get "/admin/categories/:id/edit" do
  @category = Category.find(params[:id])
  @title = "Edit Cateogry"
  haml :"admin/categories/edit"
end

put "/admin/categories/:id" do
  @category = Category.find(params[:id])
  if @category.update_attributes(params[:category])
    redirect "admin/categories"
  else
    haml :"admin/categories/edit"
  end
end
 
delete "/admin/categories/:id" do
  @category = Category.find(params[:id]).destroy
  redirect "/"
end




# Get all of our routes
get "/" do
  @posts = Post.order("created_at DESC").limit(5)
  haml :"pages/welcome"
end

get "/posts" do
  @posts = Post.order("created_at DESC")
  haml :"posts/index"
end 
 
# Get the individual page of the post with this ID.
get "/posts/:id" do
  @post = Post.find(params[:id])
  @title = @post.title
  @comment = Comment.new
  haml :"posts/show"
end

#creates comments
post "/post/:id/comments" do
  @comment = Comment.new(params[:comment])
  @post = Post.find(params[:id])
  if @comment.save
    redirect "posts/#{@post.id}"
  else
    haml :"posts/show"
  end
end
 
# Our About Me page.
get "/about" do
  @title = "About Me"
  haml :"pages/about"
end