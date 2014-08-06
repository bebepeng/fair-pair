class ReposController < LoginfilterController
  def index
    @repo = Repo.new
    @repos = User.find(current_user_id).repos
  end
  def create
    repo_info = params["repo"]["owner"].split('/')
    repo = User.find(current_user_id).repos.new(:owner => repo_info[0], :name => repo_info[1])
    if GithubApi.new(repo.owner, repo.name).valid?
      repo.save
      redirect_to repos_path, notice: 'Repo Successfully Added'
    else
      redirect_to repos_path, notice: 'Invalid Repo'
    end
  end
  def destroy
    Repo.find(params["id"]).destroy
    redirect_to repos_path, notice: 'Repo Successfully Removed'
  end
end