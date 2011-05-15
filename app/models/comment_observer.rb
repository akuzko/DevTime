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
    @@redis.publish "comments.#{comment.event_id}", {:action => action, :comment => comment.id}.to_json
  end
end
