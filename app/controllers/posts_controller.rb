class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:index, :rewarding, :show]

	def index
		@posts=Post.all		
	end
#진행중인 후원
	def rewarding
		@posts=Post.all
	end
#진행중인 후원끝

	def show
		@photos = @post.photos
		
		#좋아요 누른사람만 감지해서 댓글을 달수있게 추가
		@comments = @post.comments
	end

	def new
		@post= Post.new
	end


#관리자권한

	def create
		@post= Post.new(post_params)

		if @post.save
			if params[:images]
				params[:images].each do |image|
					@post.photos.create(image: image)
				end
			end
			@photos = @post.photos
			redirect_to @post, notices: "저장성공"
		else
			render :new
			flash[:alert] = "저장실패"
		end		
	end

	def edit
	end

	def update
		if @post.update(post_params)
			if params[:images]
				params[:images].each do |image|
					@post.photos.create(image: image)
				end
			end

			redirect_to @post, notices: "업뎃성공"
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
		params.require(:post).permit(:title, :subtitle, :link, :description_first, :description_second, :description_third, :fans, :brand, :sub_first, :sub_second, :end_date)
	end
end

