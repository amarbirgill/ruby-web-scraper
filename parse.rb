require 'nokogiri'
require 'open-uri'

class Parse

  def initialize(url)
    doc = Nokogiri::HTML(File.open(open(url)))
    @title = doc.search('.title > a:nth-child(2)').map {|link| link.inner_text}
    @url = doc.search('.title > a:nth-child(2)').map {|link| link['href']}
    @post_id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href']}
    @points = doc.search('.score').map { |span| span.inner_text}
    @comments = doc.search('.comment > font:first-child').map {|font| font.inner_text}
    @user_id = doc.search('.comhead > a:first-child').map {|link| link.inner_text}
    @time = doc.search('.comhead > a:nth-child(2)').map {|link| link.inner_text}
  end  
end

# 