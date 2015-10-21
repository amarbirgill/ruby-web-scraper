require_relative 'parse'
require_relative 'post'
require_relative 'comment'
require 'colorize'


p   "Welcome to HackerNews Web Scraper"
p   "Please enter a HackerNews url"
url = gets.chomp

parse = Parse.new(url)

post = Post.new(parse.title.first, parse.url.first, parse.points.first, parse.post_id.first)

parse.comments.each_with_index do |comment, index|
  post.add_comment(Comment.new(parse.user_id[index], parse.time[index], comment))
end

p   "You are currently viewing"
p   "#{post.title} on #{post.url}"


# run = true
while 1
  
  puts   "Here is a list of available commands"
  p   "find - shows all comments by user"
  p   "show - Show all comment objects"
  p   "exit - exit the application"
  p   "help - repeat this menu"
  

  reply = gets.chomp
  reply.downcase!
  
  case reply

  when 'help'

    p   "Here is a list of available commands"
    p   "find - shows all comments by user"
    p   "show - Show all comment objects"
    p   "exit - exit the application"
    p   "help - repeat this menu"

  when 'find'
    p "what is the username"
    username = gets.chomp
     post.comments_array.find_all {|comment| comment.user_id == username}.each do |contact| 
      puts contact.comment.colorize(:light_blue) 
    end
  
  when 'show'
    post.comments

  when 'exit'
    # run = false
    break

  end

end