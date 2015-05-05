class PageController < ApplicationController
  def index
  	p "test in PageController"
  	puts session[:user_id]
  end
end
