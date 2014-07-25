require 'spec_helper'

describe command('su - hansolo -c "~/.rbenv/bin/rbenv -v"') do
  it { should return_stdout /rbenv \d.\d.\d/ }
end

describe command('su - hansolo -c "~/.rbenv/shims/ruby -v"') do
  it { should return_stdout /ruby 2.1.2/ }
end

describe command('su - hansolo -c "~/.rbenv/shims/bundle -v"') do
  it { should return_stdout /Bundler version 1.6.\d/ }
end

# Check we pick up ruby versions correctly
describe command('su - hansolo -c "rm -rf bundletest; git clone https://github.com/theodi/bundletest.git bundletest; cd bundletest/onepointninepointthree; ~/.rbenv/shims/ruby -v"') do
  it { should return_stdout /1.9.3/ }
end

# And can bundle
describe command('su - hansolo -c "rm -rf bundletest; git clone https://github.com/theodi/bundletest.git bundletest; cd bundletest/onepointninepointthree; ~/.rbenv/shims/bundle"') do
  it { should return_exit_status 0 }
end

# And for 2.1.2
describe command('su - hansolo -c "rm -rf bundletest; git clone https://github.com/theodi/bundletest.git bundletest; cd bundletest/twopointonepointtwo; ~/.rbenv/shims/ruby -v"') do
  it { should return_stdout /2.1.2/ }
end

# And can bundle
describe command('su - hansolo -c "rm -rf bundletest; git clone https://github.com/theodi/bundletest.git bundletest; cd bundletest/twopointonepointtwo; ~/.rbenv/shims/bundle"') do
  it { should return_exit_status 0 }
end
