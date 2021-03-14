module Page::RenderMarkdown
  def render_markdown(source : String)
    options = Markd::Options.new(smart: true)
    Markd.to_html(source, options)
  end
end
