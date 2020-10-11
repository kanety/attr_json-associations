module AttrJson::Associations
  module Builder
    class HasMany
      def initialize(klass, assoc)
        @klass = klass
        @assoc = assoc
      end

      def define
        @klass.class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{@assoc.name}
            assoc = self.class.attr_json_associations["#{@assoc.name}"]
            @attr_json_associations_cache[assoc.name] ||=
              AttrJson::Associations::Builder::HasMany::Loader.new(assoc, self).load
          end
        RUBY
      end

      class Loader
        def initialize(assoc, record)
          @assoc = assoc
          @record = record
        end

        def load
          value = @record.public_send(@assoc.primary_key)
          if value.present?
            @assoc.scoped.jsonb_contains(@assoc.foreign_key => value)
          else
            @assoc.scoped.none
          end
        end
      end
    end
  end
end
