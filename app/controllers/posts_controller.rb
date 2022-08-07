class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post, methods: [:summary]
  end

  def summary
    post = find_post
    render json: post, serializer: PostSummarySerializer
  end

  private

  def find_post
    Post.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Post not found" }, status: :not_found
  end

end
