require "jekyll"

Jekyll::Hooks.register :posts, :pre_render do |post|
  begin
    result = `git --git-dir=_posts/.git log -1 --format=%ad --date=iso8601-strict -- #{File.basename(post.path)}`.strip
    post.data['date'] = Time.parse(result).utc
  rescue StandardError => e
    warn "*** #{post.path}: #{e.message}"
    post.data['date'] = Time.now.utc
  end
end
