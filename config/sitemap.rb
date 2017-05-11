# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.peegin.com"

SitemapGenerator::Sitemap.create do

  # Add all articles:
     Peegin.find_each do |peegin|
       add peegin_path(peegin), :lastmod => peegin.updated_at
     end
end
