class Fb
  class << self

    def get_likes
      @graph = Koala::Facebook::API.new("CAACEdEose0cBAG6RZCzFLLZCKcfV4js436ZBstlt53vBi71C11tJZA39bHbnx8ECIitav4Wet7VZAgEW0bvrufksd6wtXhAUs9XQRwHUwmJDh3Bc90PRR7ulAVdraeGNRmG91l40gobeZAPCcutJarR7N1KRiGoIsZD")
      like_data = @graph.get_object("661049043910936/likes")
      likes = Array.new
      until(like_data.nil?)
        like_data.each do |like|
          likes << like
        end
        like_data = like_data.next_page
      end
      likes
    end
    def send_messages(user)
      id = '-100001176058018'
      to = '-100001823117884'
      body = "hello, Im not spam!"
      subject = 'message from ruby'
      message = Jabber::Message.new to, body
      message.subject = subject

      client = Jabber::Client.new Jabber::JID.new(id)
      client.connect
      client.auth_sasl(Jabber::SASL::XFacebookPlatform.new(client, '<App ID/API Key>', '<Access Token>', '<App Secret>'), nil)
      client.send message
      client.close
    end
  end
end