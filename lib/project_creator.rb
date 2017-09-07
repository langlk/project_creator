require 'fileutils'

class ProjectCreator

  def make_directory_name(name)
    name.downcase.split.join("_")
  end

  def make_project(name)
    project_root = make_directory_name(name)
    begin
      FileUtils.mkdir("../" + project_root)
      FileUtils.cd("../" + project_root)
      FileUtils.mkdir("lib")
      FileUtils.mkdir("spec")
    rescue SystemCallError => e
      return e.class
    end
  end
end
