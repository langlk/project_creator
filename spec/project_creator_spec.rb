require 'rspec'
require 'fileutils'
require 'project_creator'

describe("ProjectCreator#make_project") do
  it("creates root directory with inputted name") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    FileUtils.cd("../new_project")
    expect(FileUtils.pwd()).to(eq("/Users/Guest/Desktop/new_project"))
  end

  it("will not create new directory with name if directory already exists") do
    creator = ProjectCreator.new()
    error = creator.make_project("new_project")
    expect(error).to(eq(Errno::EEXIST))
    FileUtils.remove_dir("../new_project")
  end
end
