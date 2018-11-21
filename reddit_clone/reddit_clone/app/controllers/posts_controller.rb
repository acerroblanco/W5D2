class PostsController < ApplicationController

  def new
    # @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to post_url(post)
    else
      flash.now[:errors] = post.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end


end
