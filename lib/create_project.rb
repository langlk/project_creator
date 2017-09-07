#!/usr/bin/env ruby

require 'pry'
require_relative 'project_creator'

if ARGV.length > 0
  project_name = ARGV[0]
  if project_name.length > 0
    creator = ProjectCreator.new()
    error = creator.make_project(project_name)
    if error == Errno::EEXIST
      abort("Error: Directory #{creator.snake_case_name(project_name)} Exists")
    else
      puts "Project created in directory #{creator.snake_case_name(project_name)}"
    end
  else
    abort("Error: No Project Name")
  end
  if ARGV.length > 1
    class_names = ARGV[1..-1]
    class_names = class_names.select {|name| name.length > 0}
    error = creator.add_class(class_names)
    if error.include?("Error: Class")
      puts error
    end
  end
else
  puts "Error: No Project Name"
end
