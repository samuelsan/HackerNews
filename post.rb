
class Post
  attr_reader :title, :date, :points, :id, :comment
  
  def initialize(doc)
    @title = doc.search('.title > a').inner_text
    @date = doc.search('.subtext > a:nth-child(3)').inner_text
    @points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}
    @id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
    @comment = doc.search('.comment > font:first-child').map { |font| font.inner_text }
  end

  def add_comment(author, comment)
    @comment << Comment.new(author,comment)
  end
end

  