class WelcomeController < ApplicationController

  require 'rubygems'
  require 'pp'
  require 'jira'

  def index

    username = "sge.mitch.yarchin"
    password = "wabbitsnot1"

    ## need to figure out how to pass encoded creds
    #encoded = Base64.encode64(username+':'+password)

    options = {
                :username => username,
                :password => password,
                :site     => 'http://jira.sleepygiant.com:8080',
                :context_path => '',
                :auth_type => :basic,
                :use_ssl => false
              }
    client = JIRA::Client.new(options)
    @projects = client.Project.all.collect(&:key)
  end
  
  def generate

    username = "sge.mitch.yarchin"
    password = "wabbitsnot1"

    ## need to figure out how to pass encoded creds
    #encoded = Base64.encode64(username+':'+password)

    options = {
                :username => username,
                :password => password,
                :site     => 'http://jira.sleepygiant.com:8080',
                :context_path => '',
                :auth_type => :basic,
                :use_ssl => false
              }

    @summary = params[:summary]
    @client = JIRA::Client.new(options)
    @project = params[:project]
    @fixversion = params[:fixversion]
  end
end