require 'yaml'

source = {:files_path => 'public/files/development', 
	:root => {:controller => 'si/ver', :action => 'index'}}

open('yaml_data', 'w') {|f| f.write(YAML::dump(source))}
open('yaml_data', 'r') {|f| puts YAML::load(f.read) }



