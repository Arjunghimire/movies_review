class PostsController < ApplicationController
	def index
		@posts=Post.all.order("created_at DESC")
	end


	def new
		@post=Post.new
		@post.my_file = params[:file] 
	end

	def create
		@post=Post.new(post_params)
		if @post.save
			redirect_to posts_path ,notice: "Successfully insert movies details"
		else
			render 'new'
		end
	end

	def show
		@post=Post.friendly.find(params[:id])
	end

	def destroy
		@post=Post.friendly.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

    def edit
    	@post=Post.friendly.find(params[:id])
    end

    def update
    	@post=Post.friendly.find(params[:id])
    	@post.update_attributes(post_params)
    	redirect_to posts_path
    end


	private
	def post_params
		params.require(:post).permit(:title,:body,:my_file,:slug)
	end
end
