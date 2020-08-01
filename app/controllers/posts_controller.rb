class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end
  def new 
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end
  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end
  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
  private
  def post_params
    params.require(:post).permit(:name, :image, :text).merge(user_id: current_user.id)
    # postの情報を持つハッシュと、user_idを持つハッシュを結合させます。
  end  
end
