module GithubApi

  PLATFORM_NOTES = ''

  ## need to store sensetive credentials in a yml
  ## need to figure out how to properly pass encoded creds

  username = 'myarchin-sge'
  password = 'wabbitsnot1'

  ## List of all Platform repositories
  plfm_repos = ['commerce_service', 'platform_admin']
  #plfm_repos = ['VacuumLeek', 'player-portal', 'platform-aws-chef', 'analytics_service', 
  #              'web-service', 'admin_widgets', 'commons', 'rule_service', 'title_service user_service', 
  #              'sge-service-template', 'platform_harness', 'platform_docs', 'admin_service', 
  #              'datum_service', 'auth_service', 'dispatcher-private', 'dispatcher-public harness daemon', 
  #              'action_worker', 'rules_worker', 'platform_admin', 'commerce_service']

  ## Queries and stores the Platform repositories for the latest version notes in RELEASE.md
  plfm_repos.each do |rpo|
    request = Github.new do |c|
      c.basic_auth          = "#{username}:#{password}"
      c.user                = 'myarchin-sge'
      c.repo                = rpo
    end
    r = request.repos.contents.get path: 'RELEASE.md', ref: 'develop'
    PLATFORM_NOTES << "### #{rpo}\n" + Base64.decode64(r[:content]).extract_string("##","##") + "\n"
  end

end