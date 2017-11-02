class HomeController < ApplicationController

  def index
    set_meta_tags(title: 'Home',
                  keywords: 'Home',
                  description: 'This is home page',
                  reverse: true,
                  separator: '&middot;'.html_safe)
  end

  def show

  end
end
