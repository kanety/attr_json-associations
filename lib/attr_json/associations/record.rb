# frozen_string_literal: true

module AttrJson::Associations
  module Record
    extend ActiveSupport::Concern

    included do
      after_initialize do
        @attr_json_associations_cache = {}
      end
    end

    def reload(...)
      @attr_json_associations_cache = {}
      super
    end
  end
end
