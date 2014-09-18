module Jekyll

  class ZoomingBox < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @markup = markup
      super
    end

    def render(context)

      # Render any liquid variables in tag arguments and unescape template code
      render_markup = Liquid::Template.parse(@markup).render(context).gsub(/\\\{\\\{|\\\{\\%/, '\{\{' => '{{', '\{\%' => '{%')

      markup = /^(?<image_src>[^\s]+\.[a-zA-Z0-9]{3,4})\s*(width=(?<width>[0-9]+))?\s*(\"(?<title>.+)\")?\s*$/.match(render_markup)
      width = markup[:width]

      if width.nil?
        <<-MARKUP.strip
        <a href="#{markup[:image_src]}" class="zimg"><img src="#{markup[:image_src]}" alt="#{markup[:title]}"></a>
        MARKUP
      else
        <<-MARKUP.strip
        <a href="#{markup[:image_src]}" class="zimg"><img width="#{width}" src="#{markup[:image_src]}" alt="#{markup[:title]}"></a>
        MARKUP
      end
    end
  end
end

Liquid::Template.register_tag('zoomingbox', Jekyll::ZoomingBox)
