# Ruby Project Creator

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
* _Bonus if we have time_ Program sets up README file template
  * Example Output: [All the README stuff]
