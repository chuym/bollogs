module Admin
  class PostsController < BaseController

    def index
      @posts = Post.all
      render "index"
    end

    def new
      render "post"
    end

    def create
      @post = Post.new post_profile
      @post.author = current_user
      if @post.save?
        redirect_to :index
      else
        render "post", status: :bad_request
      end
    end

    private

    def post_profile
      params.require(:post).permit(:name, :javascripts, :content)
    end
  end
end
