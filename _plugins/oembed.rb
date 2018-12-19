require 'jekyll'
require 'net/http'

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.content.gsub!(/\n\n<(https:\/\/twitter\.com\/\w+\/status\/\w+)>$/) do |link|
    match = Regexp.last_match

    uri = URI("https://publish.twitter.com/oembed?url=#{match[1]}")
    data = JSON.parse(Net::HTTP.get(uri))

    link + ":\n" + '<article>' + data['html'].gsub(/<script.+<\/script>/, "") + '</article>'
  end
end
