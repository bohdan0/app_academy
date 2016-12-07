require_relative '02_searchable'
require 'active_support/inflector'

require 'byebug'
# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # debugger
    class_name.constantize
  end

  def table_name
    "#{class_name.downcase}s"
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @name = name
    @options = options
  end

  def primary_key
    @options[:primary_key] || :id
  end

  def foreign_key
    @options[:foreign_key] || "#{@name}_id".to_sym
  end

  def class_name
    (@options[:class_name] || @name.to_s.camelcase).to_s
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @name = name
    @self_class_name = self_class_name
    @options = options
  end

  def primary_key
    @options[:primary_key] || :id
  end

  def foreign_key
    @options[:foreign_key] ||
      "#{@self_class_name.downcase}_id".to_sym
  end

  def class_name
    @options[:class_name] ||
      @name.to_s.singularize.capitalize
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    assoc_options[name] = BelongsToOptions.new(name, options)

    define_method(name) do
      options = self.class.assoc_options[name]
      key_value = self.send(options.foreign_key)
      options
        .model_class
        .where(options.primary_key => key_value)
        .last
    end
  end

  def has_many(name, options = {})
    self.assoc_options[name] = HasManyOptions.new(name, self.name , options)

    define_method(name) do
      options = self.class.assoc_options[name]
      key_value = self.send(options.primary_key)
      options
        .model_class
        .where(options.foreign_key => key_value)
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
    @assoc_options
  end
end

class SQLObject
  extend Associatable
end
