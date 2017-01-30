require 'raml_parser'
require 'jekyll'
require 'json'

module Jekyll

  class Api08Page < Jekyll::Page

    def initialize(site, raml_hash, output_file)
      @site = site
      @base = site.source
      @dir = File.dirname(output_file)
      @name = File.basename(output_file)

      # Write RAML to /tmp/<name>.json
      File.open("/tmp/#{raml_hash['title'].split(' ').first.downcase}.json", 'w') do |f|
        f.write(JSON.pretty_generate(raml_hash).to_s)
      end

      self.process(@name)
      self.read_yaml(File.join(site.source, '_layouts'), 'api-0.8.html')
      self.data['title'] = raml_hash['title']
      self.data['api'] = raml_hash
    end

  end

  class Api10Page < Jekyll::Page

    def initialize(site, raml_hash, output_file)
      @site = site
      @base = site.source
      @dir = File.dirname(output_file)
      @name = File.basename(output_file)

      # Write RAML to /tmp/<name>.json
      File.open("/tmp/#{raml_hash['title'].split(' ').first.downcase}.json", 'w') do |f|
        f.write(JSON.pretty_generate(raml_hash).to_s)
      end

      self.process(@name)
      self.read_yaml(File.join(site.source, '_layouts'), 'api-1.0.html')
      self.data['title'] = raml_hash['title']
      self.data['api'] = raml_hash
    end

  end

  class RamlGenerator < Jekyll::Generator

    attr_reader :site

    def generate(site)
      @site = site
      Jekyll.logger.info('RAML', '- generate API documentation from RAML files')
      site.config.fetch('raml_08_map', {}).each do |raml_file, html_file|
        Jekyll.logger.info('RAML', "- convert #{raml_file} to #{html_file}")
        raml = raml_08_file_to_hash(raml_file)
        site.pages << Api08Page.new(site, raml, html_file)
      end
      site.config.fetch('raml_10_map', {}).each do |raml_file, html_file|
        Jekyll.logger.info('RAML', "- convert #{raml_file} to #{html_file}")
        raml = raml_10_file_to_hash(raml_file)
        site.pages << Api10Page.new(site, raml, html_file)
      end
    end

    def raml_08_file_to_hash(raml_file)
      raml = RamlParser::Parser.parse_file(raml_file)
      to_deep_hash(raml)
    end

    def raml_10_file_to_hash(raml_file)
      JSON.parse(`b raml2json #{raml_file}`)
    end

    protected

    def to_deep_hash(val)
      hash = {}
      val.instance_variables.each do |key|
        hash[key[1..-1]] = deeply_to_hash(val.instance_variable_get(key))
      end
      hash
    end

    def deeply_to_hash(val)
      if val.is_a?(Hash)
        convert_hash_values(val)
      elsif val.is_a?(Array)
        convert_array_values(val)
      elsif val.instance_variables.size > 0
        to_deep_hash(val)
      else
        val
      end
    end

    def convert_hash_values(hash)
      new_hash = {}
      hash.each do |key, val|
        new_hash[key] = deeply_to_hash(val)
      end
      new_hash
    end

    def convert_array_values(array)
      new_array = []
      array.each_index do |index|
        new_array[index] = deeply_to_hash(array[index])
      end
      new_array
    end

  end

  module ApiFilters

    def mediatype_displayname(input)
      case input
      when /application\/json/i
        "JSON"
      when /application\/xml/i
        "XML"
      when /text\/xml/i
        "XML"
      when /application\/soap/i
        "SOAP"
      when /text\/html/i
        "HTML"
      else
        input
      end
    end

    def mediatype_highlight_lang(input)
      case input
      when /application\/json/i
        "json"
      when /application\/xml/i
        "xml"
      when /text\/xml/i
        "xml"
      when /application\/soap/i
        "xml"
      when /text\/html/i
        "html"
      else
        input
      end
    end

    def json2hash(input)
      JSON.parse(input)
    end

  end
end

Liquid::Template.register_filter(Jekyll::ApiFilters)
