# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://glacial-retreat-51710.herokuapp.com'

SitemapGenerator::Sitemap.create do
  add new_user_registration_path, priority: 0.7, changefreq: 'weekly'
  add new_user_session_path,      priority: 0.7, changefreq: 'weekly'
  add new_user_password_path,     priority: 0.7, changefreq: 'weekly'
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all profiles:
  #
  Profile.find_each do |profile|
    add public_profile_path(profile.friendly_id.downcase), lastmod: profile.updated_at, priority: 0.6, changefreq: 'weekly'
  end
end
