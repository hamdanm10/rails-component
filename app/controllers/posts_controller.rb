class PostsController < ApplicationController
  def index
    @q = Post.all.ransack(params[:q])
    @posts = @q.result(distinct: true).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Data successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = post_scope
  end

  def update
    @post = post_scope

    if @post.update(post_params)
      redirect_to posts_path, notice: 'Data successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = post_scope

    @post.destroy
    redirect_to posts_path, notice: 'Data successfully deleted.'
  end

  private

  def post_scope
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title, :content
    )
  end
end
