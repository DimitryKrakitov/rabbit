class PostController < ApplicationController
  before_action :authenticate_user!

  def index
    
    @posts = Post.order(created_at: :desc).first(20)

  end

  def show

    @post = Post.find(params[:id])

  end

  def new

  end

  def upvoting
    #byebug
    p = Post.find(params[:upvote_form][:post_id])
    p.update(upvote: p.upvote + 1)
    redirect_to show_posts_path(p.id), notice: 'Post upvoted.'

  end

  def downvoting

    p = Post.find(params[:downvote_form][:post_id])
    p.update(downvote: p.downvote + 1)
    redirect_to show_posts_path(p.id), notice: 'Post downvoted.'

  end

  def commenting

    c = Comment.create(
      user_id: current_user.id, post_id: params[:comment_form][:post_id], body: params[:comment_form][:body]
    )    
    redirect_to show_posts_path(params[:comment_form][:post_id]), notice: 'Comment was successfully created.'
  end

  def create

    p = Post.create(
      user_id: current_user.id, title: params[:create_post][:title], body: params[:create_post][:body]
    )

    redirect_to show_posts_path(p.id), notice: 'Post was successfully created.'

    
  end

end
