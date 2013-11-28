class WelcomeController < ApplicationController
  include JiraQuery

  def index
    @projects = CLIENT.Project.all.collect(&:key)
  end
  
  def generate
    @summary = params[:summary]
    @client = CLIENT
    @project = params[:project]
    @fixversion = params[:fixversion]
  end
end