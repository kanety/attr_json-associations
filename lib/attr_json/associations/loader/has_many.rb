# frozen_string_literal: true

require_relative 'has_collection'

module AttrJson::Associations
  module Loader
    class HasMany < HasCollection
      def call
        load
      end
    end
  end
end
