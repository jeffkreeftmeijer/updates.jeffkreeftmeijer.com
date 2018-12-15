require "jekyll"

Jekyll::Hooks.register [:pages, :documents], :post_render do |document|
  document.output.gsub!(/@(\w+)\@twitter\.com/, '<a href="https://twitter.com/\\1">@\\1</a>')
  document.output.gsub!(/@(\w+)@([\w\.]+\.\w+)/, '<a href="https://\\2/@\\1">@\\1</a>')
end
