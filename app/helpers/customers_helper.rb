module CustomersHelper
  def gravatar_for customer, options = { size: Settings.gravatar.size }
    gravatar_id = Digest::MD5::hexdigest(customer.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: customer.name, class: "gravatar")
  end
end
