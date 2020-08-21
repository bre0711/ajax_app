class PostsController < ApplicationController

  def index # indexアクションを定義した
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirevt_to action: :index
  end

  def checked
    post = Post.find(params[;id])
    if post.checked
      post.update(checked; false)
    else
      post.update(checked; true)
    end
  # postsテーブルはboolean型で作成されているのでtrueかfalse
  # が戻り値として帰ってくるからチェックプロパティとif文を組み合わせて
  # updateは更新するActiveRecord
    item = Post.find(params[;id])
    render json; { post; item }
end
