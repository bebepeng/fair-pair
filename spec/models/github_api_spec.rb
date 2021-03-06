require 'rails_helper'

describe GithubApi do
  it 'returns the last commit to the repo' do
    VCR.use_cassette('githubapi/commits') do
      github = GithubApi.new('bebepeng', 'single-page-app')
      github_commit = github.recent_commit

      response = {"sha"=>"91251e4b5204b5d2dc7a2e9b120d7ded8d90840b", "commit"=>{"author"=>{"name"=>"Bebe Peng", "email"=>"bebepeng@gmail.com", "date"=>"2014-06-12T00:04:29Z"}, "committer"=>{"name"=>"Seth Musulin", "email"=>"sethmusulin@gmail.com", "date"=>"2014-06-12T00:04:29Z"}, "message"=>"refactored code to only reset form after successful post\n\nSigned-off-by: Seth Musulin <sethmusulin@gmail.com>", "tree"=>{"sha"=>"0f524f46d3d80917f5399c89264b7a5b19612853", "url"=>"https://api.github.com/repos/bebepeng/single-page-app/git/trees/0f524f46d3d80917f5399c89264b7a5b19612853"}, "url"=>"https://api.github.com/repos/bebepeng/single-page-app/git/commits/91251e4b5204b5d2dc7a2e9b120d7ded8d90840b", "comment_count"=>0}, "url"=>"https://api.github.com/repos/bebepeng/single-page-app/commits/91251e4b5204b5d2dc7a2e9b120d7ded8d90840b", "html_url"=>"https://github.com/bebepeng/single-page-app/commit/91251e4b5204b5d2dc7a2e9b120d7ded8d90840b", "comments_url"=>"https://api.github.com/repos/bebepeng/single-page-app/commits/91251e4b5204b5d2dc7a2e9b120d7ded8d90840b/comments", "author"=>{"login"=>"bebepeng", "id"=>5025819, "avatar_url"=>"https://avatars.githubusercontent.com/u/5025819?v=2", "gravatar_id"=>"4fd3474400a033ec4e91fff9bd6a744f", "url"=>"https://api.github.com/users/bebepeng", "html_url"=>"https://github.com/bebepeng", "followers_url"=>"https://api.github.com/users/bebepeng/followers", "following_url"=>"https://api.github.com/users/bebepeng/following{/other_user}", "gists_url"=>"https://api.github.com/users/bebepeng/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/bebepeng/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/bebepeng/subscriptions", "organizations_url"=>"https://api.github.com/users/bebepeng/orgs", "repos_url"=>"https://api.github.com/users/bebepeng/repos", "events_url"=>"https://api.github.com/users/bebepeng/events{/privacy}", "received_events_url"=>"https://api.github.com/users/bebepeng/received_events", "type"=>"User", "site_admin"=>false}, "committer"=>{"login"=>"SethMusulin", "id"=>1314348, "avatar_url"=>"https://avatars.githubusercontent.com/u/1314348?v=2", "gravatar_id"=>"e064cafd76c7f95f1a5877de24de40e9", "url"=>"https://api.github.com/users/SethMusulin", "html_url"=>"https://github.com/SethMusulin", "followers_url"=>"https://api.github.com/users/SethMusulin/followers", "following_url"=>"https://api.github.com/users/SethMusulin/following{/other_user}", "gists_url"=>"https://api.github.com/users/SethMusulin/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/SethMusulin/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/SethMusulin/subscriptions", "organizations_url"=>"https://api.github.com/users/SethMusulin/orgs", "repos_url"=>"https://api.github.com/users/SethMusulin/repos", "events_url"=>"https://api.github.com/users/SethMusulin/events{/privacy}", "received_events_url"=>"https://api.github.com/users/SethMusulin/received_events", "type"=>"User", "site_admin"=>false}, "parents"=>[{"sha"=>"70708100cbebf37ab135aa3caea2923cc6199ce4", "url"=>"https://api.github.com/repos/bebepeng/single-page-app/commits/70708100cbebf37ab135aa3caea2923cc6199ce4", "html_url"=>"https://github.com/bebepeng/single-page-app/commit/70708100cbebf37ab135aa3caea2923cc6199ce4"}]}
      expect(github_commit).to eq response
      expect(github.valid?).to eq true
    end
  end
  it 'returns something for a 404' do
    VCR.use_cassette('githubapi/commits/fail') do
      github = GithubApi.new('bebepeng', 'stuffIdonthave')
      github_commit = github.commits

      response = {"message"=>"Not Found", "documentation_url"=>"https://developer.github.com/v3"}
      expect(github_commit).to eq response
      expect(github.valid?).to eq false
    end
  end
end