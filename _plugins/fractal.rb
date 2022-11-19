require 'json'

class FractalImageTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    # Set defaults first, replace with your values!
    image_id = "xxxxxx"
    image_file = "yyyyy"
    image_caption = "zzzzz"

    # Attempt to parse the JSON if any is passed in
    begin
      if( !@input.nil? && !@input.empty? )
        jdata = JSON.parse(@input)
        image_id = jdata["image_id"].strip
        image_file = jdata["image_file"].strip
        image_caption = jdata["image_caption"].strip
      end
    rescue
    end

    # Write the output HTML string
    output = "<figure id=\"#{image_id}\">"
    output += "<a href=\"{{ \"/assets/images/#{image_file}\" | relative_url }}\">"
    output += "<img src=\"{{ \"/assets/images/#{image_file}\" | relative_url }}\">"
    output += "</a>"
    output += "<figcaption>#{image_caption}</figcaption>"
    output += "</figure>"

    # Render it on the page by returning it
    return output;
  end
end

Liquid::Template.register_tag('fractal', FractalImageTag)