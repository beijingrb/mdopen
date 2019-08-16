require 'os'
require 'redcarpet'
require 'tempfile'
require 'tilt/erb'
require 'mdopen/version'

module Mdopen
  class << self
    def preview(md_file)
      content = md2html(md_file)
      tmp_file = new_tmpfile
      html_file_path = tmp_file.path
      erb_render(content, tmp_file)
      system "#{open_cmd} file://#{html_file_path}"
    end

    def erb_render(content, tmp_file)
      template_path = File.join(__dir__, 'templates/github.html.erb')
      template = Tilt::ERBTemplate.new(template_path)
      output = template.render(self, content: content)
      tmp_file.write(output)
      tmp_file.close
    end

    def md2html(md_file)
      parser = Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new,
        fenced_code_blocks: true,
        tables: true,
        autolink: true,
        space_after_headers: true,
        highlight: true,
        quote: true,
        strikethrough: true,
        superscript: true,
        no_intra_emphasis: true)
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

    def new_tmpfile
      filename = tmp_filename
      tmp_file = Tempfile.new([filename, '.html'])
      # prevent tempfile from deleting by GC
      ObjectSpace.undefine_finalizer(tmp_file)
      tmp_file
    end

    def tmp_filename
      [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten.sample(12).join
    end
  end
end
