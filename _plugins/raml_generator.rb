require 'raml_parser'
require 'pp'

module RamlGenerator

  def self.generate_api_docs(site, site_payload)
    site.config.fetch('raml_map').each do |raml_file, html_file|
      raml2html(raml_file, html_file)
    end
  end

  def self.raml2html(raml_file, html_file)
    puts "Convert #{raml_file} to #{html_file}"
    raml = RamlParser::Parser.parse_file(raml_file)

    output_dir = File.dirname(html_file)
    FileUtils.mkdir_p(output_dir) unless File.directory? output_dir
    File.open(html_file, 'w') do |f|
      f.write("---
layout: page
title: #{raml.title}
---
<div class=\"post\">

  <header class=\"post-header\">
    <h1 class=\"post-title\">#{raml.title}</h1>
  </header>

</div>

")
    end

  end

  def self.register_jekyll_hook
    Jekyll::Hooks.register :site, :pre_render, &RamlGenerator.method(:generate_api_docs)
  end
end

RamlGenerator.register_jekyll_hook
