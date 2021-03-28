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
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

# ストロングパラメータ
  private
  def blog_params
    # 意図的にpermitの「category」を「categoly」へ変更
    params.require(:blog).permit(:title, :categoly, :body)
  end
end
