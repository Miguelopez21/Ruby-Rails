
module Api
    module V1
        class PostsController < ApplicationController
        include ActionController::HttpAuthentication::Token::ControllerMethods
        before_action :authenticate , only: [:update,:create,:destroy]

            def index #GET
                @posts= Post.order('updated_at DESC')
                if @posts 
                    render json: @posts
                else
                    render json: @posts.errors, status: :unprocessable_entity  
                end
            end

            def show #GET/PARAM
                @post = Post.find(params[:id]) 
                if @post 
                    render json: @post
                else
                    render json: @post.errors, status: :unprocessable_entity  
                end
            end

            def destroy #DELETE/PARAM
            end

            def update #PUT|PATH/PARAMS
            end

            def create #POST/PARAMS
                @post = @user.posts.new (post_params)
                if @post.save
                    render json: @post, status: :created
                else
                    render json: @post.errors , status: :unprocessable_entity 
                end
            end

            private
            def post_params
                params.require(:post).permit(:title,:body)
            end

            def authenticate
                authenticate_or_request_with_http_token do |token,options|
                    @user = User.find_by(token: token)
                end                
            end        
        end

    end
end
