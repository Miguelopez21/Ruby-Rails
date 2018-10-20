module Api
    module V1
        class PostsController < ApplicationController

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
        
            end
        end

    end
end
