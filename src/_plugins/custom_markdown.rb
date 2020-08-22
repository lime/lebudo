class ::Jekyll::Converters::Markdown::CustomMarkdown
  RENDERER_OPTIONS = {
    safe_links_only: true,
    hard_wrap: true,
    link_attributes: {
      target: "_blank",
      rel: "noopener noreferrer nofollow"
    }
  }

  EXTENSIONS = {
    autolink: true
  }

  def initialize(config)
    begin
      require "redcarpet"
    rescue LoadError
      STDERR.puts "You are missing a library required for Markdown. Please run:"
      STDERR.puts "  $ gem install redcarpet"
      raise FatalException.new("Missing dependency: redcarpet")
    end

    renderer = ::Redcarpet::Render::HTML.new(RENDERER_OPTIONS)
    @markdown = ::Redcarpet::Markdown.new(renderer, EXTENSIONS)
  end

  def convert(content)
    @markdown.render(content)
  end
end
