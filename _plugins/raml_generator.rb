require 'raml_parser'
require 'jekyll'
require 'json'
require 'pp'

module Jekyll

  class Api08Page < Jekyll::Page
    attr_reader :sort_order

    def initialize(site, raml_hash, output_file, sort_order)
      @site = site
      @base = site.source
      @dir = File.dirname(output_file)
      @name = File.basename(output_file)
      @sort_order = sort_order

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
    attr_reader :sort_order

    def initialize(site, raml_hash, output_file, sort_order)
      @site = site
      @base = site.source
      @dir = File.dirname(output_file)
      @name = File.basename(output_file)
      @sort_order = sort_order

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

      unsorted_pages = []
      site.config.fetch('raml_08_map', {}).each do |raml_file, raml_file_data|
        Jekyll.logger.info('RAML', "- convert #{raml_file} to #{raml_file_data['target']}")
        raml = raml_08_file_to_hash(raml_file)
        unsorted_pages << Api08Page.new(site, raml, raml_file_data['target'], raml_file_data['sort_order'])
      end
      site.config.fetch('raml_10_map', {}).each do |raml_file, raml_file_data|
        Jekyll.logger.info('RAML', "- convert #{raml_file} to #{raml_file_data['target']}")
        raml = raml_10_file_to_hash(raml_file)
        unsorted_pages << Api10Page.new(site, raml, raml_file_data['target'], raml_file_data['sort_order'])
      end
      site.pages.push(*(unsorted_pages.sort_by {|page| page.sort_order}))
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
      when /json/i
        "json"
      when /xml/i
        "xml"
      when /soap/i
        "xml"
      when /html/i
        "html"
      else
        input
      end
    end

    def json2hash(input)
      JSON.parse(input)
    end

    def is_raml_builtin_type(input)
      ['any', 'object', 'array', 'number', 'boolean', 'string',
        'date-only', 'time-only', 'datetime-only', 'datetime',
        'file', 'integer', 'nil'].include? input
    end

    def is_raml_custom_type(input)
      not is_raml_builtin_type(input)
    end

    def extract_type(types, type_name)
      match = types.select do |t|
        t[type_name]
      end

      first_match = match.first
      if first_match then first_match[type_name] else nil end
    end

  end
end

Liquid::Template.register_filter(Jekyll::ApiFilters)
