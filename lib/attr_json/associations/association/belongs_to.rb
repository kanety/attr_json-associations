# frozen_string_literal: true

require_relative 'base'

module AttrJson::Associations
  module Association
    class BelongsTo < Base
      def resolve_primary_key
        @klass.primary_key.to_s
      end

      def resolve_foreign_key
        if @name.to_s == @name.to_s.pluralize
          "#{@name.to_s.singularize}_ids"
        else
          "#{@name}_id"
        end
      end
    end
  end
end
