require 'fileutils'

class ProjectCreator

  def make_directory_name(name)
    name.downcase.split.join("_")
  end

  def make_project(name)
    begin
      FileUtils.mkdir("../" + make_directory_name(name))
    rescue SystemCallError => e
      return e.class
    end
  end
end
