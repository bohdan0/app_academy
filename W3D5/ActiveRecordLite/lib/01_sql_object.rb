require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @table ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    @table.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.to_s.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(data)
  end

  def self.parse_all(results)
    results.map do |hash|
      self.new(hash)
    end
  end

  def self.find(id)
    data = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
      LIMIT
        1
    SQL

    data.empty? ? nil : self.new(data.first)
  end

  def initialize(params = {})
    @table_name = self.class.table_name
    params.each do |attr_name, value|
      if self.class.columns.include?(attr_name.to_sym)
        send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values

    result = []
    self.class.columns.each do |attribute|
      result << self.send(attribute)
    end

    result
  end

  def insert
    columns = self.class.columns
    column_names = columns.join(", ")
    question_marks = (['?'] * columns.length).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name}
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns.map { |name| "#{name} = ?" }.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL
  end

  def save
    self.id.nil? ? insert : update
  end
end
