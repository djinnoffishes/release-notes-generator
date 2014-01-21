module GithubApi

  PLATFORM_NOTES = ''

  ## need to store sensetive credentials in a yml
  ## need to figure out how to properly pass encoded creds

  username = 'producerapi-sge'
  password = 'sl33py69'
  token = 'ae440e76ea0f5e198039952fd19a80ad915e3dea'

  ## List of all Platform repositories
  plfm_repos = ['commerce_service', 'platform_admin', 'harness', 'title_service', 'commons', 'rule_service', 
                'user_service', 'admin_widgets', 'dispatcher-private', 'dispatcher-public', 'platform_docs',
                'admin_service', 'platform_harness', 'datum_service', 'analytics_service']

  ## Queries and stores the Platform repositories for the latest version notes in RELEASE.md
  plfm_repos.each do |rpo|
    request = Github.new do |c|
      #c.basic_auth          = "#{username}:#{password}"
      c.oauth_token         = token
      c.user                = 'sge'
      c.repo                = rpo
    end
    r = request.repos.contents.get path: 'RELEASE.md', ref: 'develop'
    PLATFORM_NOTES << "### #{rpo} -" + Base64.decode64(r[:content]).extract_string("##","##") + "\n"
  end

end