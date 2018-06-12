require "os"
require 'redcarpet'
require 'tempfile'
require "mdopen/version"
require "mdopen/erb_template"

module Mdopen
  class << self
    def preview(md_file)
      content = md2html(md_file)
      html_file_path = tmp_path
      erb_render(content, html_file_path)
      system "#{open_cmd} file://#{html_file_path}"
    end

    def erb_render(content, html_file_path)
      erb_t = Mdopen::ErbTemplate.new(content, get_template)
      erb_t.save(html_file_path)
    end

    def get_template
      template_file = File.join(__dir__, 'templates/github.html.erb')
      File.read(template_file)
    end

    def md2html(md_file)
      parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, fenced_code_blocks: true)
      parser.render(md_file)
    end

    def open_cmd
      if OS.mac?
        "open"
      elsif OS.windows?
        "cmd /c start"
      else
        "xdg-open"
      end
    end

    def tmp_path
      filename = tmp_filename
      tmp = Tempfile.new([filename, ".html"])
      tmp.path
    end

    def tmp_filename
      [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten.sample(12).join
    end
  end
end
