#!/usr/bin/env ./script/runner

pages = Page.find_all_by_mime('file')
#pages.each {|p| puts p.title + ": " + p.meta(:date) + ": " + p.position.to_s}
sorted = pages.sort {|a,b| b.meta(:date) <=> a.meta(:date)}
#sorted.each {|p| puts p.title + ": " + p.meta(:date) + ": " + p.position.to_s}
sorted.each_with_index {|p, index| p.update_attribute('position', index + 1)}
