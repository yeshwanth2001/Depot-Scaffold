class PostsController < ApplocationController
    def index
        @posts = Post.all
    end
end