class Github::Users::RepositoryService
  BASE_URL='https://api.github.com'

  def initialize(username:)
    @username = username
  end

  def call
    fetch_user_repositories
  end

  private

  def fetch_user_repositories
    HTTP.get("#{BASE_URL}/#{@username}/repos")
  end
end