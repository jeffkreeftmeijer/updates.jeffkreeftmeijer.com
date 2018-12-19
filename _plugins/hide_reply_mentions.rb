require "jekyll"

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.content.gsub!(/^(@[\w\@\.]+ )+/, "") if post.data['in_reply_to']
end
