#Filters
before do
  @categories = Category.all
  puts '[Params]'
  p params
end

before "/admin/*" do
  unless admin_present?
    redirect "/"
  end
end


# Admin routes
get "/admin" do
  @title = "Admin Login"
  haml :"admin/login"
end

post "/login" do
  @admin = Admin.find_by(username: params[:username])
  if @admin.authenticate(params[:password])
    session[:user] = @admin
    redirect "/admin/index"
  else
    @errors = "Invalid username or password"
    haml :"admin/login"
  end 
end

get "/logout" do
  session[:user] = nil
  redirect "/"
end


# Post routes
get "/admin/index" do
  @posts = Post.order("created_at DESC")
  @categories = Category.order("created_at DESC")
  @title = "Admin"
  haml :"admin/index"
end

get "/admin/posts/new" do
  @title = "New Post"
  @post = Post.new
  haml :"admin/posts/new"
end

post "/admin/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "admin/index"
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
    redirect "admin/index"
  else
    haml :"admin/posts/edit"
  end
end
 
delete "/admin/posts/:id" do
  @post = Post.find(params[:id]).destroy
  redirect "admin/index"
end


# category routes
get "/admin/categories/new" do
  @title = "New Cateogry"
  @category = Category.new
  haml :"admin/categories/new"
end

post "/admin/categories" do
  @category = Category.new(params[:category])
  @category.image = params[:category][:image]
  if @category.save
    redirect "admin/index"
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
    redirect "admin/index"
  else
    haml :"admin/categories/edit"
  end
end
 
delete "/admin/categories/:id" do
  @category = Category.find(params[:id]).destroy
  redirect "admin/index"
end


# home, post, comment routes
get "/" do
  @homepage = true
  @posts = Post.order("created_at DESC").limit(5)
  haml :"pages/welcome"
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  @title = @post.title
  @comment = Comment.new
  haml :"posts/show"
end

post "/post/:id/comments" do
  @comment = Comment.new(params[:comment])
  @post = Post.find(params[:id])
  if @comment.save
    redirect "posts/#{@post.id}"
  else
    haml :"posts/show"
  end
end
 
# Archive routes
get "/archive/:id" do
  @category = Category.find(params[:id])
  @title = @category.title
  haml :"archive/show"
end

get "/archive" do
  @posts = Post.order("created_at DESC")
  haml :"archive/index"
end 

# Our About Me page.
get "/about" do
  @title = "About Me"
  haml :"pages/about"
end