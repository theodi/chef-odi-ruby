node.default['rbenv']['user_installs'] = [
  {
    'user'    => 'vagrant',
    'rubies'  => [
      '2.1.2'
    ],
    'global'  => '2.1.2',
    'gems'    => {
      '2.1.2' => [
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
]


# node.default['rbenv']['rubies'] = [
#   #"1.9.3-p547",
#   #"2.0.0-p481",
#   "2.1.2"
# ]
#
# node.default['rbenv']['global'] = "2.1.2"
#
# node.default['rbenv']['plugins'] = [
# ]
