require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    values = params.values
    conditions = params.keys.map { |key| "#{key} = ?" }.join(" AND ")

    data = DBConnection.execute(<<-SQL, *values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{conditions}
    SQL

    parse_all(data)
  end
end

class SQLObject
  extend Searchable
end
