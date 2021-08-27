module ApplicationHelper

    def gravatar_for(user, options = { size: 80})
        email_address = user.email.downcase
        hash= Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gavatar_url="https://www.gravatar.com/avatar/#{hash}?=#{size}"
        image_tag(gavatar_url, alt: user.username)
    end
end
