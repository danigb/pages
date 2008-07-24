
#ENV['INLINEDIR'] = File.join(File.dirname(__FILE__),"../../inline")
APP_CONFIG = {:files_path => 'public/files/development', 
  :root => {:controller => 'si/ver', :action => 'index'}
}