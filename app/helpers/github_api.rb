module GithubApi

  NOTES = ''

  ## Queries and stores the repositories for the latest version notes in RELEASE.md
  APP_CONFIG['repositories'].each do |rpo|
    request = Github.new do |c|
      c.oauth_token         = APP_CONFIG['github_api_key']
      c.user                = APP_CONFIG['user']
      c.repo                = rpo
    end
    r = request.repos.contents.get path: 'RELEASE.md', ref: 'develop'
    NOTES << "##### #{rpo} -" + Base64.decode64(r[:content]).extract_string("##","##") + "\n"
  end

end