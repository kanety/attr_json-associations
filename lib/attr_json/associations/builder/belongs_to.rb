module AttrJson::Associations
  module Builder
    class BelongsTo
      def initialize(klass, assoc)
        @klass = klass
        @assoc = assoc
      end

      def define
        @klass.class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{@assoc.name}
            assoc = self.class.attr_json_associations["#{@assoc.name}"]
            @attr_json_associations_cache[assoc.name] ||=
              AttrJson::Associations::Builder::BelongsTo::Loader.new(assoc, self).load
          end
        RUBY
      end

      class Loader
        def initialize(assoc, record)
          @assoc = assoc
          @record = record
        end

        def load
          if @record.class.attr_json_registry[@assoc.foreign_key].array_type?
            load_from_array
          else
            load_from_single_value
          end
        end

        private

        def load_from_array
          value = @record.public_send(@assoc.foreign_key)

          if value.present?
            @assoc.scoped.where(@assoc.primary_key => value).order(array_order(value))
          else
            @assoc.scoped.none
          end
        end

        def load_from_single_value
          value = @record.public_send(@assoc.foreign_key)

          if value
            @assoc.scoped.find_by(@assoc.primary_key => value)
          else
            nil
          end
        end

        def array_order(value)
          mapping = { @assoc.primary_key => value.map.with_index { |v, i| [v, i] }.to_h }
          column = @assoc.klass.connection.quote_table_name("#{@assoc.klass.table_name}.#{@assoc.primary_key}")
          order = "CASE #{column} "
          order << value.map.with_index { |v, i| "WHEN #{v} THEN #{i}" }.join(' ')
          order << " ELSE #{value.size} END"
          Arel.sql(order)
        end
      end
    end
  end
end
