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
      begin
        profile = post_profile
        @post = Post.new profile
        @post.author = current_user
        if @post.valid?
          @post.save
          redirect_to "index"
        else
          redirect_to({ action: 'new' }, error: @post.errors)
        end
      rescue ActionController::ParameterMissing
        errors = { :base => t("admin.errors.missing_parameter", parameter: "post") }
        redirect_to({ action: "new" }, error: errors)
      end
    end

    private

    def post_profile
      params.require(:post).permit(:title, :javascripts, :content)
    end
  end
end
