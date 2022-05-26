class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end


  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

   # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
