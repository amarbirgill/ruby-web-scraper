class Post
  
  attr_reader :title, :url, :comments_array

  def initialize(title, url, points, post_id)
    @title = title
    @url = url
    @points = points
    @post_id = post_id
    @comments_array = []
  end

  def comments
    @comments_array.each do |comment|
      p comment
    end
  end

  def add_comment(comment)
    @comments_array << comment
  end


end