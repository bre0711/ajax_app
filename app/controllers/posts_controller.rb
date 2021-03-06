class PostsController < ApplicationController

  def index # indexアクションを定義した
    @posts = Post.all.order(id: "DESC")
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end
  # postsテーブルはboolean型で作成されているのでtrueかfalse
  # が戻り値として帰ってくる
  # updateは更新するActiveRecord
    item = Post.find(params[:id])
    render json: { post: item }
  end
end



