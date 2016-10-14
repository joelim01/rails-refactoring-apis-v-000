class RepositoriesController < ApplicationController

  def index
    gh_service = GithubService.new({"access_token" => session[:token]})
    @repos_array = gh_service.get_repos()
  end

  def create
    gh_service = GithubService.new({"access_token" => session[:token]})
    gh_service.create_repo(params[:name])
    redirect_to '/'
  end
end
