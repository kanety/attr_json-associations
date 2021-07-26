# frozen_string_literal: true

require_relative 'base'

module AttrJson::Associations
  module Loader
    class HasCollection < Base
      def load
        value = @record.public_send(@assoc.primary_key)
        if value.present?
          @assoc.scoped.merge(target_scope(@assoc.foreign_key, value))
                       .merge(target_order(@assoc.foreign_key, value))
        else
          @assoc.klass.none
        end
      end
    end
  end
end
