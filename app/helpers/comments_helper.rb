module CommentsHelper

  def stuff_name(id)
    a = Stuff.find_by_id(id.to_s)
    a.title
  end
end
