module ApplicationHelper
  include Pagy::Frontend

  def full_title page_title = ""
    base_title = t ".base_title"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
