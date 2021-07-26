# frozen_string_literal: true

require_relative 'association/belongs_to'
require_relative 'association/has_many'
require_relative 'association/has_one'
require_relative 'loader/belongs_to'
require_relative 'loader/has_many'
require_relative 'loader/has_one'

module AttrJson::Associations
  class Definer
    def initialize(type, klass, args, options)
      @type = type
      @klass = klass
      @assoc = Association.const_get(@type.to_s.classify).new(klass, args, options)
    end

    def call
      @klass.attr_json_associations = @klass.attr_json_associations.merge(@assoc.name => @assoc)
      @klass.class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{@assoc.name}
          assoc = self.class.attr_json_associations[:#{@assoc.name}]
          @attr_json_associations_cache[:#{@assoc.name}] ||=
            AttrJson::Associations::Loader::#{@type.to_s.classify}.new(assoc, self).call
        end
      RUBY
    end
  end
end
