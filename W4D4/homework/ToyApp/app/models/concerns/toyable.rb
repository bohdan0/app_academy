module Toyable
  extend ActiveRecord::Concern

  included do
    has_many :toys, as: :toyable
  end

  def recieve_toy(name)
    toy = Toy.find_or_create_by(name: name, toyable_id: self.id, toyable_type: self.class.name) do
      Toy.new(name: name, toyable_id: self.id, toyable_type: self.class.name)
    end

    toy.update(name: name, toyable_id: self.id, toyable_type: self.class.name)
  end
end
