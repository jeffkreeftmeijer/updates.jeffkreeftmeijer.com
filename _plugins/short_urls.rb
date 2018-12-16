require "jekyll"

Jekyll::Hooks.register [:pages, :documents], :post_render do |document|
  document.output.gsub!(/<a href="([^"]+")>(\w+:\/\/(w{3}\.)?)([^<]+)<\/a>/) do
    match = Regexp.last_match
    url = match[4].gsub("/", "/<wbr>")
    %(<a href="#{match[1]}"><span class="invisible">#{match[2]}</span>#{url}</a>)
  end
end
