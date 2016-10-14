class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    gh_service = GithubService.new()
    gh_service.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:token] = gh_service.access_token

    session[:username] = gh_service.get_username
    redirect_to '/'
  end
end
