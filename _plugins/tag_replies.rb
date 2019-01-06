require 'jekyll'
require 'net/http'

Jekyll::Hooks.register :site, :post_read do |site|
  site.posts.docs.each do |post|
    post.data['tags'] << "noreply" unless post.data['in_reply_to']
  end
end
