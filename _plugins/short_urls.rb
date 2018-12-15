require "jekyll"

Jekyll::Hooks.register [:pages, :documents], :post_render do |document|
  document.output.gsub!(/<a href="([^"]+")>(\w+:\/\/(w{3}\.)?)([^<]+)<\/a>/, '<a href="\\1"><span class="invisible">\\2</span>\\4</a>')
end
