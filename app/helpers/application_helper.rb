module ApplicationHelper

  def categories
    Category.all
  end

  def category_names_ids
    list = []
    Category.all.each do |element|
      list.append([element.category, element.id])
    end
    @list = list
  end

  def titles
    list = []
    Stuff.all.each do |element|
      list.append(element.title)
    end
    @list = list
  end

  def tags
    list = []
    cat_list = []

    Category.all.each do |element|
      cat_list.append(element.category)
    end

    ActsAsTaggableOn::Tag.all.each do |element|
      if cat_list.include? element.name
        'ok'
      else
        list.append(element.name)
      end
    end
    @list = list
  end
end
