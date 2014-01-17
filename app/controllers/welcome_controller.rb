class WelcomeController < ApplicationController
  include JiraQuery

  def index
    @projects = CLIENT.Project.all.collect(&:key)
  end
  
  def generate
    @intnotes = params[:intnotes]
    @othernotes = params[:othernotes]
    @client = CLIENT
    @project = params[:project]
    @fixversion = params[:fixversion]
    @incl_type = true if params[:incl_type]
    @incl_assignee = true if params[:incl_type]
  end
end