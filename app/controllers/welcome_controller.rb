class WelcomeController < ApplicationController
  include JiraQuery, GithubApi

  def index
    @projects = CLIENT.Project.all.collect(&:key)
    @platform_notes = PLATFORM_NOTES
  end
  
  def generate
    @intnotes = params[:intnotes]
    @client = CLIENT
    @project = params[:project]
    @fixversion = params[:fixversion]
    @incl_type = true if params[:incl_type]
    @incl_assignee = true if params[:incl_type]
  end
end