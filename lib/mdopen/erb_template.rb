require 'erb'

module Mdopen
  class ErbTemplate
    include ERB::Util
    attr_accessor :content, :template

    def initialize(content, template)
      @content = content
      @template = template
    end

    def render()
      ERB.new(@template).result(binding)
    end

    def save(file)
      File.write(file, render)
    end
  end
end

