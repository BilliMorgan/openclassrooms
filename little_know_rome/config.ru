#! usr/bin/env ruby
require 'rack'
load 'authentication.rb'
load 'visit_counter.rb'
load 'app.rb'

use Authentication, "posts" do |username, password|
  (username == 'super') && (password == 'secret')
end

use VisitCounter
run App.new