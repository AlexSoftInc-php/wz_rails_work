class CommentsController < ApplicationController
		# Если добавить строчку ниже и добавить в исключение метод create тогда комменты будут добавляться только если чел знает пароль
		# http_basic_authenticate_with name: "admin", password: "admin123", except: [:index, :show]
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)

		redirect_to post_path(@post)
	end

	private def comment_params
		params.require(:comment).permit(:username, :body)
	end
end