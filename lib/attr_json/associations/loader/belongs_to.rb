# frozen_string_literal: true

require_relative 'base'

module AttrJson::Associations
  module Loader
    class BelongsTo < Base
      def call
        if attr_json_definition(@record.class, @assoc.foreign_key)&.array_type?
          load
        else
          load[0]
        end
      end

      private

      def load
        value = @record.public_send(@assoc.foreign_key)
        if value.present?
          @assoc.scoped.merge(target_scope(@assoc.primary_key, value))
                       .merge(target_order(@assoc.primary_key, value))
        else
          @assoc.klass.none
        end
      end
    end
  end
end
