class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    helper PostHelper

    def index
        if params[:q].present? && params[:q] == "newest"
            @posts = Post.order(created_at: :desc).page params[:page]
        else
            @posts = Post.order(cached_votes_up: :desc).page params[:page]
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            @post.liked_by current_user
            redirect_to @post, notice: 'Post was successfully created'
        else 
            render 'new'
        end
    end

    def update 
    end

    def destroy
    end

    private 

    def post_params
        params.require(:post).permit(:title, :link, :body).merge(user_id: current_user.id)
    end

end
