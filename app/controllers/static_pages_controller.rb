class StaticPagesController < ApplicationController
  def home
    @stuffs = Stuff.all
  end

  def payment
  end

  def delivery
  end

  def about
  end
end
