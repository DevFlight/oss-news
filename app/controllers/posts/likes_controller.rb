class Posts::LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
        @post.liked_by current_user
        respond_to do |format|
            format.html { redirect_to @post }
            format.js
        end
    end

    private 

        def set_post
            @post = Post.find(params[:post_id])
        end
end