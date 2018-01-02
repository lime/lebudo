directory "_pages" do
  dato.pages.each do |page|
    create_post "#{page.slug}.md" do
      attributes = {
        title: page.title,
        subtitle: page.subtitle,
        position: page.position,
        background_image: page.background_image.url,
        layout: "page"
      }

      attributes.reject! do |_, value|
        value.nil? || value.respond_to?(:empty?) && value.empty?
      end

      frontmatter(:yaml, attributes)
      content(page.body)
    end
  end
end
