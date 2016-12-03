class Car < ApplicationRecord

  belongs_to :person,
    primary_key: :name,
    foreign_key: :owner_name,
    class_name: 'Person'

end
