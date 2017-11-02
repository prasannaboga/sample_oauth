class HomeController < ApplicationController

  def index
    page_meta_tags(title: 'Home',
                   keywords: 'Home Page, Sample, Example, Oauth, Doorkeeper',
                   description: 'This is home page')
  end

  def show

  end
end
