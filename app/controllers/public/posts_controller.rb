class Public::PostsController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    #@post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(',')
    if @post.save
      @post.save_tags(tag_list)
      redirect_to post_path(@post.id), success: t('posts.create.create_success')
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @tags = @post.tags.pluck(:tag_name).join(',')
  end

  def edit
    @post = Post.find(params[:id])
    @tags = @post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tags = params[:post][:tag_name].split(',')
    if @post.update(post_params)
      @post.save_tags(tags)
      #flash[:notice] = "You have updated user successfully."
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path

  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    #検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @posts = @tag.posts
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :area, :event_name, :event_detail,
   :image, :lat, :lng)
  end

  def article_params
    params.require(:article).permit(:body, tag_ids: [])
  end

end
