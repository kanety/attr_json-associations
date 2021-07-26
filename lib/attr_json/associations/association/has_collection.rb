# frozen_string_literal: true

require_relative 'base'

module AttrJson::Associations
  module Association
    class HasCollection < Base
      def resolve_primary_key
        @owner.primary_key.to_s
      end

      def resolve_foreign_key
        "#{@owner.name.demodulize.underscore}_id"
      end
    end
  end
end
