require('pry')
require_relative('models/bounty_class.rb')

SpaceCowboy.delete_all()

bounty_1 = SpaceCowboy.new(
{
  'name' => 'Fred',
  'species' => 'Frog',
  'homeworld' => 'Tadpolean',
  'favourite_weapon' => 'Fly Swat'
}
)

bounty_2 = SpaceCowboy.new(
{
  'name' => 'Boba Fett',
  'species' => 'Human',
  'homeworld' => 'Kamino',
  'favourite_weapon' => 'Blaster Rifle'
}
)

binding.pry
nil
