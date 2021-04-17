class History < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１年未満' },
    { id: 3, name: '１年以上３年未満' },
    { id: 4, name: '４年以上' },
    { id: 5, name: '上級者' },
  ]

  include ActiveHash::Associations
  has_many :users
end