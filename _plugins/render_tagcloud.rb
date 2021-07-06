module Jekyll
  # render a tag cloud
  class RenderTagCloud < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      @size_min, @size_max, @precision, @unit = 100, 370, 0, '%'
      @threshold                              = 1

      base_url = context['site.baseurl']
      tags = context['tags']
      return unless tags.class == Array
      tags.reject! {|i| i.nil? }
      site_tags = context['site.tags']
      by_length = site_tags.values.map(&:length)
      max = by_length.max
      min = by_length.min
      cloud = tags.map do |t|
        tag_size = site_tags[t].length
        "<div class=\"tagcloud-tag #{size_tag(min,max,tag_size)}\">"\
          "<a href=\"#{base_url}/tags/#{t.downcase}\" style=\"#{size_log_tag(min,max,tag_size)}\">"\
          "#{t}"\
          "</a>"\
          "</div>"
      end.join("\n")
      "<div class=\"tagcloud\">#{cloud}</div>"
    end

    private
	
	def size_log_tag(min, max, count)
	  # logarithmic distribution
	  weight = (Math.log(count) - Math.log(min))/(Math.log(max) - Math.log(min))
      size = @size_min + ((@size_max - @size_min) * weight).to_f
      size = sprintf("%.#{@precision}f", size)
	  "font-size: #{size}#{@unit}"
	end

    def size_tag(min, max, count)
      diff = (max - min)
      if count < (min + (diff * 0.1))
        'tagcloud-tag-s'
      elsif count < (min + (diff * 0.3))
        'tagcloud-tag-m'
      elsif count < (min + (diff * 0.5))
        'tagcloud-tag-l'
      else
        'tagcloud-tag-xl'
      end
    end
  end
end

Liquid::Template.register_tag('render_tagcloud', Jekyll::RenderTagCloud)

# sample css:
# .tagcloud {
  # .tagcloud-tag {
    # display: inline;
    # white-space: nowrap;
    # padding: 0.6em;
  # }
  # .tagcloud-tag-s a {
    # // default font size
    # color: #00CED1;
  # }
  # .tagcloud-tag-m a {
    # color: #0000FF;
  # }
  # .tagcloud-tag-l a {
    # color: #4B0082;
  # }
  # .tagcloud-tag-xl a {
    # color: #FF0000;
  # }
# }
