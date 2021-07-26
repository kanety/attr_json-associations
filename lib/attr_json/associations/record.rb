# frozen_string_literal: true

module AttrJson::Associations
  module Record
    extend ActiveSupport::Concern

    def reload(...)
      @attr_json_associations_cache = {}
      super
    end

    private

    def init_internals
      @attr_json_associations_cache = {}
      super
    end
  end
end
