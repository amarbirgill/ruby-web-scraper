class Comment

  attr_reader :user_id, :time, :comment

  def initialize(user_id, time, comment)
    @user_id = user_id
    @time = time
    @comment = comment
  end
end
