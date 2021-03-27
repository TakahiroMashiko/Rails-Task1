class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])

  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blog_params)
    blog.save
    # 以下の行を修正
    redirect_to blog_path(blog.id)
  end

  def edit
  end

# ストロングパラメータ
  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
