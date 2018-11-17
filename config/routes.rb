Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated do
      root 'post#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'posts', to: 'post#index'
  get 'posts/:id', to: 'post#show', as: :show_posts
  get 'posts_new', to: 'post#new', as: :new_posts
  post 'posts', to: 'post#create', as: :create_posts

  get 'users', to: 'user#index'
  get 'users/:id', to: 'user#show', as: :show_user

  put 'posts_upvote', to: 'post#upvoting', as: :upvote_posts
  put 'posts_downvote', to: 'post#downvoting', as: :downvote_posts

  post 'posts_comment', to: 'post#commenting', as: :comment_posts



end
