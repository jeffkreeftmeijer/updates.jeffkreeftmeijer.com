require 'jekyll'
require 'net/http'

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.content.gsub!(/<(https:\/\/twitter\.com\/\w+\/status\/\w+)>/) do
    match = Regexp.last_match

    uri = URI("https://publish.twitter.com/oembed?url=#{match[1]}")
    data = JSON.parse(Net::HTTP.get(uri))

    '<article>' + data['html'].gsub(/<script.+<\/script>/, "") + '</article>'
  end
end
