# frozen_string_literal: true

module AttrJson::Associations
  module Model
    extend ActiveSupport::Concern

    def initialize(...)
      @attr_json_associations_cache = {}
      super
    end
  end
end
