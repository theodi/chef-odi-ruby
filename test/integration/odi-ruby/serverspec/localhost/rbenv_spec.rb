require 'spec_helper'

describe command('su - vagrant -c "~/.rbenv/bin/rbenv -v"') do
  it { should return_stdout /rbenv \d.\d.\d/ }
end

describe command('su - vagrant -c "~/.rbenv/shims/ruby -v"') do
  it { should return_stdout /ruby 2.1.2/ }
end

describe command('su - vagrant -c "~/.rbenv/shims/bundle -v"') do
  it { should return_stdout /Bundler version 1.6.\d/ }
end

# Check we can actually do a bundle
describe command('su - vagrant -c "rm -rf test; git clone https://github.com/badges/badgerbadgerbadger.git test; cd test; ~/.rbenv/shims/bundle"') do
  it { should return_exit_status 0 }
end
