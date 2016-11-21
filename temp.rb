class Parent
  def parent_method
    puts 'in parent'
  end
  class Child
    def child_mehtod
      puts 'in child'
    end
  end
end
par = Parent.new
par.parent_method

a = Parent::Child.new
a.child_mehtod
