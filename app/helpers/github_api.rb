module GithubApi

  ## need to store sensetive credentials in a yml

  ## need to figure out how to properly pass encoded creds

  username = 'myarchin-sge'
  password = 'wabbitsnot1'

  request = Github.new do |c|
    c.basic_auth          = "#{username}:#{password}"
    c.user                = 'myarchin-sge'
    c.repo                = 'platform_admin'
  end
  
  r = request.repos.contents.get path: 'RELEASE.md', ref: 'develop'

  PLATFORM_NOTES = Base64.decode64(r[:content]).extract_string("##","##")

end