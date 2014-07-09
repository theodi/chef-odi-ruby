require 'spec_helper'

describe command('~/.rbenv/bin/rbenv -v') do
  it { should return_stdout /rbenv \d.\d.\d/ }
end

describe command('~/.rbenv/shims/ruby -v') do
  it { should return_stdout /ruby 2.1.2/ }
end
