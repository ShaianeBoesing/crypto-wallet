class WelcomeController < ApplicationController
  layout :get_layout

  def get_layout
    'admin' if params.has_key?(:admin) 
  end

  def index
  end
end
