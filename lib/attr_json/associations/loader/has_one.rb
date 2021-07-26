# frozen_string_literal: true

require_relative 'has_collection'

module AttrJson::Associations
  module Loader
    class HasOne < HasCollection
      def call
        load[0]
      end
    end
  end
end
