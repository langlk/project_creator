#!/usr/bin/env ruby

require 'rspec'
require 'fileutils'
require 'project_creator'
require 'pry'

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

  it("adds basic gems to Gemfile") do
    gemfile_expected = "source 'https://rubygems.org'\n\ngem 'rspec'\ngem 'pry'"
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    gemfile = File.open("../new_project/Gemfile", "r")
    gemfile_contents = gemfile.read
    expect(gemfile_contents).to(eq(gemfile_expected))
    FileUtils.remove_dir("../new_project")
  end

  it("sets up README file template") do
    creator = ProjectCreator.new()
    creator.make_project("new project")
    readme = File.open("../new_project/README.md", "r")
    readme_expected = File.open("readme_expected.md", "r")
    expect(readme.read).to(eq(readme_expected.read))
  end
end

describe("ProjectCreator#snake_case_name") do
  it("properly changes string to snake case") do
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
    FileUtils.remove_dir("../new_project")
  end

  it("adds basic text to class script file") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    creator.add_class(["newclass"])
    script_file = File.open("../new_project/lib/newclass.rb", "r")
    script_contents = script_file.read
    expect(script_contents).to(eq("#!/usr/bin/env ruby\n\nclass Newclass\nend"))
    FileUtils.remove_dir("../new_project")
  end

  it("adds basic text to class spec file") do
    creator = ProjectCreator.new()
    creator.make_project("new_project")
    creator.add_class(["newclass"])
    script_file = File.open("../new_project/spec/newclass_spec.rb", "r")
    script_contents = script_file.read
    expect(script_contents).to(eq("#!/usr/bin/env ruby\n\nrequire 'rspec'\nrequire 'newclass'\n\ndescribe('Newclass') do\nend"))
    FileUtils.remove_dir("../new_project")
  end
end

describe("ProjectCreator#camel_case_name") do
  it("properly formats string to camel case") do
    creator = ProjectCreator.new()
    expect(creator.camel_case_name("New class")).to(eq("NewClass"))
  end
end
