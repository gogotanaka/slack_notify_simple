require "slack_notify_simple/version"

require "json"

module SlackNotifySimple
  def self.call(url:, title:, message:, icon:)
    uri = URI(url)
contents = <<-EOS
@channel:
```
#{message}
```
EOS
    hash = {
      "payload"=> {
        "username"    => title,
        "text"        => contents,
        "icon_emoji"  => icon
      }.to_json
    }
    Net::HTTP.post_form(uri, hash)
  end
end
