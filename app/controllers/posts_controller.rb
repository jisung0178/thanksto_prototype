class PostsController < ApplicationController
before_action :find_post, only: [:edit, :update]

	def index
		@posts=Post.all		
	end

	def show
		@post= Post.new
	end

	def new
		@post= Post.new
	end


#관리자권한

	def create
		@post= Post.new(post_params)

		if @post.save
			redirect_to @post
			flash[:alert] = "저장성공"
		else
			render :new
			flash[:alert] = "저장실패"
		end		
	end

	def edit
	end

	def update
		if @post.update
			redirect_to @post
			flash[:alert] = "업뎃성공"
		else
			render :edit
			flash[:alert] = "업뎃실패"
		end
	end

	def destroy
		
	end

#관리자권한 끝

	private
	def find_post
		@post=Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :link, :description, :fans, :end_date)
	end
end

