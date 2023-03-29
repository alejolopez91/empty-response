class PromptController < ApplicationController
  before_action :authenticate_user!

  def create
    response = OpenaiSearchService.search(params[:prompt])

    
  end
end