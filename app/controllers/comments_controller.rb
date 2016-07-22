class CommentsController < ApplicationController
	

	def create
		@comment = current_user.comments.create(comment_params)
		redirect_to @comment.post
	end

	def destroy
		@comment = Comment.find(params[:id])
		post = @comment.post
		@comment.destory
		
		redirect_to post
	end

	private
	def	comment_params
		params.require(:comment).permit(:contents, :post_id)
	end	
end
