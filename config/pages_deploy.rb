
ENV['INLINEDIR'] = File.join(File.dirname(__FILE__),"../../inline")
$pages = {:files_path => 'public/files', 
  :root => {:controller => 'si/ver', :action => 'index'},
  :edit => {:controller => 'si/cambiar', :action => 'index'},
  :user => {:name => 'solidaridad', :pass => 'solidaridad'}
}
