require 'fileutils'

class ProjectCreator
  def initialize
    @project_root = ""
  end

  def snake_case_name(name)
    name.downcase.split.join("_")
  end

  def camel_case_name(name)
    words = name.split
    words.each do |word|
      word.capitalize!
    end
    words.join("")
  end

  def make_project(name)
    @project_root = snake_case_name(name)
    begin
      FileUtils.mkdir("../" + @project_root)
      FileUtils.cd("../" + @project_root) {
        FileUtils.mkdir(["lib", "spec"])
        FileUtils.touch(["Gemfile", "README.md"])
        gemfile = File.open("Gemfile", "w")
        gemfile.print("source 'https://rubygems.org'\n\ngem 'rspec'\ngem 'pry'")
        gemfile.close
      }
    rescue SystemCallError => e
      return e.class
    end
  end

  def fill_script(name)
    script_file = File.open("../#{@project_root}/lib/#{snake_case_name(name)}.rb", "w")
    script_file.print("class #{camel_case_name(name)}\nend")
    script_file.close
  end

  def fill_spec(name)
    spec_file = File.open("../#{@project_root}/spec/#{snake_case_name(name)}_spec.rb", "w")
    spec_file.print("require 'rspec'\nrequire '#{snake_case_name(name)}'\n\ndescribe('#{camel_case_name(name)}') do\nend")
    spec_file.close
  end

  def add_class(names)
    names.each do |name|
      file_name = snake_case_name(name)
      unless @project_root == 0
        FileUtils.cd("../" + @project_root) {
          if File.exists?("lib/" + file_name + ".rb") | File.exists?("spec/" + file_name + "_spec.rb")
            return "Error: Class " + name + " Exists"
          end
          FileUtils.touch(["lib/" + file_name + ".rb", "spec/" + file_name + "_spec.rb"])
          fill_script(name)
          fill_spec(name)
        }
      end
    end
  end
end
