module GithubApi

  NOTES = ''

  ## Queries and stores the repositories for the latest version notes in RELEASE.md
  ENV['REPOSITORIES'].split(', ').each do |rpo|
    request = Github.new do |c|
      c.oauth_token         = ENV['GITHUB_API_KEY']
      c.user                = ENV['USER']
      c.repo                = rpo
    end
    r = request.repos.contents.get path: 'RELEASE.md', ref: 'develop'
    NOTES << "##### #{rpo} -" + Base64.decode64(r[:content]).extract_string("##","##") + "\n"
  end

end