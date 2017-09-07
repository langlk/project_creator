# Ruby Project Creator

#### _Epicodus Practice in Ruby, September 7, 2017_

#### By Kelsey Langlois and Luciano Oliveira

## Description

_A Ruby script that creates the skeleton directory for a Ruby project, including a Gemfile with rspec and pry, a README with a template, and lib and spec files for each class name provided._

## Setup/Installation Requirements

* Clone this repository
* From the root directory, run ```$ ruby lib/create_project.rb "project name" "class name" "class name"```
  * Project name is required.
  * Class names are optional; include none, or as many as are needed.
* A directory "project_name" will be created in the parent directory where this repository is located.

## Specifications

* Program creates root directory with inputted name in directory above project_creator
  * Example Input: "new_project"
  * Example Output: new directory "Desktop/new_project"
* Program will not create new directory with name if directory already exists
  * Example Input: "old_project"
  * Example Output: "Error: Project Exists Already"
* Program properly formats multi-word name
  * Example Input: "New Project"
  * Example Output: "new_project"
* Program creates lib and spec directories within root directory
  * Example Output: directories "new_project/lib" and "new_project/spec"
* Program creates Gemfile and README.md files
  * Example Output: "new_project/Gemfile" and "new_project/README.md"
* Program makes script and spec files for a class name provided by the user
  * Example Input: "newclass"
  * Example Output: "lib/newclass.rb" and "spec/newclass_spec.rb"
* Program returns an error if the files already exist.
  * Example Input: "oldclass"
  * Example Output: "Error: Class Already Exists"
* Program properly formats class names provided by user
  * Example Input: "NewClass"
  * Example Output: "newclass.rb"
  * Example Input: "New New Class"
  * Example Output: "new_new_class.rb"
* Program makes script and spec files for multiple classes provided by the user
  * Example Input: "NewClass", "New New Class"
  * Example Output: "lib/newclass.rb", "lib/new_new_class.rb", "spec/newclass_spec.rb", "spec/new_new_class_spec.rb"
* Program adds basic gems to Gemfile
  * Example Output:

        source 'https://rubygems.org'

        gem 'rspec'
        gem 'pry'
* Program adds basic text to class files
  * Example Input: "Newclass"
  * Example Output:

        # Script File
        class Newclass
        end

        # Spec File
        require 'rspec'
        require 'newclass'

        describe('Newclass') do
        end
* Program properly formats class name in files
  * Example Input: "new class"
  * Example Output: ```class NewClass```
* Program sets up README file template
  * Example Output: [All the README stuff]

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby

### License

Copyright (c) 2017 **Kelsey Langlois, Luciano Oliveira**

*This software is licensed under the MIT license.*
