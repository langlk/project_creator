require 'fileutils'

class ProjectCreator

  def make_project(name)
    begin
      FileUtils.mkdir("../" + name)
    rescue SystemCallError => e
      return e.class
    end
  end
end
