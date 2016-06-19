class WelcomeController < ApplicationController
  def index

  end
  
  def search
    @hoge = params[:book][:title]
  end
end
