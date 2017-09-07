require 'fileutils'

class ProjectCreator
  def initialize
    @project_root = ""
  end

  def snake_case_name(name)
    name.downcase.split.join("_")
  end

  def make_project(name)
    @project_root = snake_case_name(name)
    begin
      FileUtils.mkdir("../" + @project_root)
      FileUtils.cd("../" + @project_root)
      FileUtils.mkdir(["lib", "spec"])
      FileUtils.touch(["Gemfile", "README.md"])
    rescue SystemCallError => e
      return e.class
    end
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
        }
      end
    end
  end
end
