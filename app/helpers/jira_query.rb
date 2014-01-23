module JiraQuery
  ## need to store this stuff in a yml

  ## need to figure out how to properly pass encoded creds
  # username = Base64.encode64("sge.mitch.yarchin").strip
  # password = Base64.encode64("wabbitsnot1").strip

  options = {
              :username => ENV['jira_username'],
              :password => ENV['jira_password'],
              :site     => ENV['jira_site'],
              :context_path => '',
              :auth_type => :basic,
              :use_ssl => false
            }
  CLIENT = JIRA::Client.new(options)
end