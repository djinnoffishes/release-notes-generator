module JiraQuery
  ## need to figure out how to properly pass encoded creds
  # username = Base64.encode64("sge.mitch.yarchin").strip
  # password = Base64.encode64("wabbitsnot1").strip
  username = 'sge.mitch.yarchin'
  password = 'wabbitsnot1'

  options = {
              :username => username,
              :password => password,
              :site     => 'http://jira.sleepygiant.com:8080',
              :context_path => '',
              :auth_type => :basic,
              :use_ssl => false
            }
  CLIENT = JIRA::Client.new(options)
end