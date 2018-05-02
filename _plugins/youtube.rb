class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+%?)\s+(\d+%?)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1
      # @width  = $3.nil? ? 800 : $3
      # @height = $4.nil? ? 600 : $4
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    return <<~HTML
    <div class="youtube-container">
      <iframe class="youtube-video" src="https://www.youtube.com/embed/#{@id}?color=white&theme=light&rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>  
    </div>
    HTML
  end

  Liquid::Template.register_tag "youtube", self
end
