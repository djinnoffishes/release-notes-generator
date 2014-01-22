module GithubApi

  PLATFORM_NOTES = ''

  ## List of all current Platform repositories
  plfm_repos = ['commerce_service', 'platform_admin', 'harness', 'title_service', 'commons', 'rule_service', 
                'user_service', 'admin_widgets', 'dispatcher-private', 'dispatcher-public', 'platform_docs',
                'admin_service', 'platform_harness', 'datum_service', 'analytics_service']

  ## Queries and stores the Platform repositories for the latest version notes in RELEASE.md
  plfm_repos.each do |rpo|
    request = Github.new do |c|
      c.oauth_token         = APP_CONFIG['github_api_key']
      c.user                = 'sge'
      c.repo                = rpo
    end
    r = request.repos.contents.get path: 'RELEASE.md', ref: 'develop'
    PLATFORM_NOTES << "### #{rpo} -" + Base64.decode64(r[:content]).extract_string("##","##") + "\n"
  end

end