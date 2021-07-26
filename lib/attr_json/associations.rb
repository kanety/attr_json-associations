# frozen_string_literal: true

require 'active_support/all'
require 'attr_json'

require_relative 'associations/version'
require_relative 'associations/record'
require_relative 'associations/model'
require_relative 'associations/definer'

module AttrJson::Associations
  extend ActiveSupport::Concern

  included do
    class_attribute :attr_json_associations
    self.attr_json_associations = {}

    if self < ActiveRecord::Base
      include AttrJson::Associations::Record
    else
      include AttrJson::Associations::Model
    end
  end

  class_methods do
    def attr_json_belongs_to(*args, **options)
      AttrJson::Associations::Definer.new(:belongs_to, self, args, options).call
    end

    def attr_json_has_many(*args, **options)
      AttrJson::Associations::Definer.new(:has_many, self, args, options).call
    end

    def attr_json_has_one(*args, **options)
      AttrJson::Associations::Definer.new(:has_one, self, args, options).call
    end
  end
end
