node.default['odi-ruby']['users'] = {}

node.default['rbenv']['user_installs'] = []

node.default['odi-ruby']['users'].each_pair do |user, rubies|

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
