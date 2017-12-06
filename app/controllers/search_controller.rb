class SearchController < ApplicationController
  def index
    @members = Member.all_by_state(params[:state])
  end
end
