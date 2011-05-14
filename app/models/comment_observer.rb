class CommentObserver < ActiveRecord::Observer
  @@redis = Redis.new

  def after_create comment
    publish :create, comment
  end

  def after_destroy comment
    publish :destroy, comment
  end

  private

  def publish action, comment
    @@redis.publish "comments.#{comment.event.id}", {:action => action, :comment => comment}.to_json
  end
end
