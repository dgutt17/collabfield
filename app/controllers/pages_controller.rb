class PagesController < ApplicationController
    def index
        @hobby_posts = Post.limit(8)
        @study_posts = Post.limit(8)
        @team_posts = Post.limit(8)
    end
end
