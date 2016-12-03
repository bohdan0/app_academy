class Person < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'

  has_many :cars,
    primary_key: :name,
    foreign_key: :owner_name,
    class_name: 'Car'

end
