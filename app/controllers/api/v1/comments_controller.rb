class Api::V1::CommentsController < ApplicationController
	before_action :set_article
	before_action :set_comment, only: [ :show, :update, :destroy ]

	def index
		@comments = @article.comments

		render json: {message: "Success", data: @comments, count: @comments.count}
  end

	def show
		render json: @comment
	end

	def create
		@comment = @article.comments.new(comment_params)

		if @comment.save
			render json: @comment, status: :created, location: api_v1_article_comment_url(@article, @comment)
		else 
			render json: @comment.errors, status: :unprocessable_entity
		end
	end

	def update
		if @comment.update(comment_params)
			render json: @comment
		else
			render json: @comment.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@comment.destroy
	end

	private

	def set_comment
		@comment = @article.comments.find(params[:id])
	end

	def set_article
		@article = ::Article.find(params[:article_id])
	end

	def comment_params
		params.require(:comment).permit(:title, :definition)
	end
end

