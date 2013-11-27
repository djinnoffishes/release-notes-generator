
    require 'json'

    file = File.read('example.json')

    jira_tickets = JSON.parse file

    jira_tickets["issues"].each do |i|
      #require 'pry';binding.pry
      @name = i["fields"]["assignee"]["displayName"]
      @email = i["fields"]["assignee"]["emailAddress"]
      @summary = i["fields"]["summary"]
      @description = i["fields"]["description"]
      @issuetype = i["fields"]["issuetype"]["name"]
      @ticketid = i["key"]
    end

    file.close