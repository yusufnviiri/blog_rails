class LikesController < ApplicationController
    def new
        @like =Like.new
    end
    def create
        @like.create( params.require(:like).permit(:post_id,:author_id))
    end
    def like_params
        params.require(:like).permit(:post_id,:author_id)
    end

end
