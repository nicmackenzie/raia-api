class DiscussionsController < ApplicationController
    def index
        render json: Discussion.all
    end
end
