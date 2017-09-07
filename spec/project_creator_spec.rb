require 'rspec'
require 'fileutils'
require 'project_creator'

describe("ProjectCreator#make_project") do
  it("creates root directory with inputted name") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    FileUtils.cd("../new_project") {
      expect(FileUtils.pwd()).to(eq("/Users/Guest/Desktop/new_project"))
    }
  end

  it("will not create new directory with name if directory already exists") do
    creator = ProjectCreator.new()
    error = creator.make_project("new_project")
    expect(error).to(eq(Errno::EEXIST))
    FileUtils.remove_dir("../new_project")
  end

  it("creates lib and spec directories within new root directory") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    FileUtils.cd("../new_project/lib") {
      expect(FileUtils.pwd()).to(eq("/Users/Guest/Desktop/new_project/lib"))
    }
    FileUtils.cd("../new_project/spec") {
      expect(FileUtils.pwd()).to(eq("/Users/Guest/Desktop/new_project/spec"))
    }
    FileUtils.remove_dir("../new_project")
  end

  it("creates Gemfile and README.md files") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    FileUtils.cd("../new_project") {
      expect(File.exists?("Gemfile")).to(eq(true))
      expect(File.exists?("README.md")).to(eq(true))
    }
    FileUtils.remove_dir("../new_project")
  end
end

describe("ProjectCreator#snake_case_name") do
  it("properly formats multi-word directory name") do
    creator = ProjectCreator.new()
    expect(creator.snake_case_name("New Project")).to(eq("new_project"))
  end
end

describe("ProjectCreator#add_class") do
  it("makes script and spec files for a class name provided by the user") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    creator.add_class(["newclass"])
    FileUtils.cd("../new_project") {
      expect(File.exists?("lib/newclass.rb")).to(eq(true))
      expect(File.exists?("spec/newclass_spec.rb")).to(eq(true))
    }
    FileUtils.remove_dir("../new_project")
  end

  it("makes script and spec files for a class name provided by the user") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    creator.add_class(["newclass"])
    error = creator.add_class(["newclass"])
    expect(error).to(eq("Error: Class newclass Exists"))
    FileUtils.remove_dir("../new_project")
  end

  it("makes script and spec files for multiple classes provided by the user") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    creator.add_class(["newclass", "new new class", "new New NEW class"])
    classes = ["newclass", "new_new_class", "new_new_new_class"]
    classes.each do |name|
      expect(File.exists?("../new_project/lib/" + name + ".rb")).to(eq(true))
      expect(File.exists?("../new_project/spec/" + name + "_spec.rb")).to(eq(true))
    end
  end
end
