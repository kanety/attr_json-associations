# frozen_string_literal: true

require_relative 'order_by_case'

module AttrJson::Associations
  module Loader
    class Base
      def initialize(assoc, record)
        @assoc = assoc
        @record = record
      end

      private

      def attr_json_definition(klass, key)
        klass.respond_to?(:attr_json_registry) && klass.attr_json_registry[key]
      end

      def target_scope(key, value)
        if (definition = attr_json_definition(@assoc.klass, key))
          if definition.array_type?
            @assoc.klass.jsonb_contains(key => value)
          else
            column = @assoc.klass.connection.quote_table_name("#{@assoc.klass.table_name}.#{definition.container_attribute}") + "->'#{key}'"
            if value.is_a?(Array)
              value = value.map { |v| "'" + @assoc.klass.connection.quote(v) + "'" }.join(', ')
              @assoc.klass.where(%Q|#{column} IN (#{value})|)
            else
              value = @assoc.klass.connection.quote(value)
              @assoc.klass.where(%Q|#{column} = '#{value}'|)
            end
          end
        else
          @assoc.klass.where(key => value)
        end
      end

      def target_order(key, value)
        if value.is_a?(Array)
          @assoc.klass.order(OrderByCase.new(@assoc.klass, key, value).call)
        else
          @assoc.klass.all
        end
      end
    end
  end
end
