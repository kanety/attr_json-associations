require 'active_support'
require 'attr_json'
require_relative 'associations/version'
require_relative 'associations/record'
require_relative 'associations/model'
require_relative 'associations/association'

module AttrJson::Associations
  extend ActiveSupport::Concern

  included do
    class_attribute :attr_json_associations

    if ancestors.include?(ActiveRecord::Base)
      include AttrJson::Associations::Record
    else
      include AttrJson::Associations::Model
    end
  end

  class_methods do
    def attr_json_belongs_to(*args, **options)
      assoc = AttrJson::Associations::Association::BelongsTo.new(self, args, options)
      self.attr_json_associations ||= HashWithIndifferentAccess.new
      self.attr_json_associations[assoc.name] = assoc

      AttrJson::Associations::Builder::BelongsTo.new(self, assoc).define
    end

    def attr_json_has_many(*args, **options)
      assoc = AttrJson::Associations::Association::HasMany.new(self, args, options)
      self.attr_json_associations ||= HashWithIndifferentAccess.new
      self.attr_json_associations[assoc.name] = assoc

      AttrJson::Associations::Builder::HasMany.new(self, assoc).define
    end
  end
end
