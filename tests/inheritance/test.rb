require 'ruty'

loader = Ruty::Loaders::Filesystem.new(:dirname => '.')
puts loader.get_template('index.html').render(
  :users => [
    {:user_id => 1, :username => 'John Doe'},
    {:user_id => 2, :username => 'Max Foobar'}
  ]
)
