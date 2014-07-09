node.default['odi-ruby']['users'] = {
  'vagrant' => '2.1.2'
}

node.default['rbenv']['user_installs'] = []

node.default['odi-ruby']['users'].each_pair do |user, ruby|
  node.default['rbenv']['user_installs'] << {
    'user'    => user,
    'rubies'  => [
      ruby
    ],
    'global'  => ruby,
    'gems'    => {
      ruby => [
        'name' => 'bundler'
      ]
    },
    'plugins' => [
      {
        'name'    => 'rbenv-bundler',
        'git_url' => 'https://github.com/carsomyr/rbenv-bundler.git'
      }
    ]
  }
end
