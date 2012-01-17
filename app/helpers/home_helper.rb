module HomeHelper
  #convert links into HTML anchor links using String's gsub method for regular expressions
  def display_content_with_links(text)
    text.gsub(/(http:\/\/[a-zA-Z0-9\/\.\+\-_:?&=]+)/) {|a| "<a href=\"#{a}\" target='_blank'>#{a}</a>"}
  end
end
