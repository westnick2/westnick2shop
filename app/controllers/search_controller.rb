class SearchController < ApplicationController
  def results
    if params[:search_field].present?
      @res = Stuff.search_by_title(params[:search_field]).all
      @input = params[:search_field]
    end
  end

  def auto_title
    @stuff =Stuff.all
  end
end
