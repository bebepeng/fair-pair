require 'faraday'
require 'json'

class GithubApi
  attr_reader :owner, :repo, :commits

  def initialize (owner, repo)
    @owner = owner
    @repo = repo
    response = connect("/repos/#{owner}/#{repo}/commits")
    @commits =  JSON.parse(response.body)
  end

  def recent_commit
    commits.first
  end

  def valid?
    !commits.include?("documentation_url")
  end

  private

  def connect(url)
    faraday = Faraday.new(:url => "https://api.github.com") do |f|
      f.adapter(Faraday.default_adapter)
      f.basic_auth(ENV['GITHUB_USERNAME'], ENV['GITHUB_PASSWORD'])
    end
    faraday.get(url)
  end
end