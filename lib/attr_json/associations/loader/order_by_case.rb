# frozen_string_literal: true

module AttrJson::Associations
  module Loader
    class OrderByCase
      def initialize(klass, key, values)
        @klass = klass
        @key = key
        @values = values
      end

      def call
        order = if (definition = attr_json_definition)
            jsonb_column_order(definition)
          else
            normal_column_order
          end
        Arel.sql(order)
      end

      private

      def attr_json_definition
        @klass.attr_json_registry[@key] if @klass.respond_to?(:attr_json_registry)
      end

      def normal_column_order
        column = @klass.connection.quote_table_name("#{@klass.table_name}.#{@key}")
        orders = ["CASE #{column}"]
        @values.each.with_index do |value, i|
          orders << "WHEN #{@klass.connection.quote(value)} THEN #{i}"
        end
        orders << "ELSE #{@values.size} END"
        orders.join(' ')
      end

      def jsonb_column_order(definition)
        column = @klass.connection.quote_table_name("#{@klass.table_name}.#{definition.container_attribute}") + "->'#{@key}'"
        orders = ["CASE #{column}"]
        @values.each.with_index do |value, i|
          orders << "WHEN '#{@klass.connection.quote(value)}' THEN #{i}"
        end
        orders << "ELSE #{@values.size} END"
        orders.join(' ')
      end
    end
  end
end
