module UsersHelper
  def avatar_img_tag(user, size = 48)
    if user.avatar_url.present?
      image_url = user.avatar_url
    else
      default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
	  image_url = "http://gravatar.com/avatar/#{gravatar_id}.png?size=#{size}&d=#{CGI.escape(default_url)}"
    end
    image_tag(image_url, :width => size, :height => size, :alt => user.name, :class => "avatar")
  end
end
