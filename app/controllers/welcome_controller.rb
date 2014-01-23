class WelcomeController < ApplicationController
  include JiraQuery, GithubApi

  def index
    @projects = CLIENT.Project.all.collect(&:key)
    @platform_notes = NOTES
  end
  
  def generate
    @intnotes = params[:intnotes]
    @client = CLIENT
    @project = params[:project]
    @fixversion = params[:fixversion]
    if params[:incl_type]
      @incl_type, @incl_assignee = true, true
    end
  end
end