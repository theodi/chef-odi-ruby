#
# Cookbook Name:: odi-ruby
# Recipe:: default
#
# Copyright 2014, The Open Data Institute
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

node.default['rbenv']['user_installs'] ||= []

node['odi-ruby']['users'].each_pair do |user, rubies|
  gems = {}
  rubies.each do |ruby|
    gems[ruby] = [{'name' => 'bundler'}]
  end

  node.default['rbenv']['user_installs'] << {
    'user'    => user,
    'rubies'  => rubies,
    'global'  => rubies[0],
    'gems'    => gems,
    'plugins' => [
      {
        'name'    => 'rbenv-bundler',
        'git_url' => 'https://github.com/carsomyr/rbenv-bundler.git'
      }
    ]
  }
end

include_recipe "ruby_build"
include_recipe "rbenv::user"
