class PostsController < ApplicationController

  def index # indexアクションを定義した
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirevt_to action: :index
  end
end
