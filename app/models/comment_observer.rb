class CommentObserver < ActiveRecord::Observer
  def after_create comment
    p "hooray! we have a comment!"
  end
end
