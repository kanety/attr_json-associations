module AttrJson::Associations
  module Association
    class BelongsTo < Base
      def initialize(owner, args, options = {})
        super
      end

      private

      def resolve_primary_key
        if @options.key?(:primary_key)
          @options[:primary_key].to_sym
        else
          @klass.primary_key.to_sym
        end
      end

      def resolve_foreign_key
        if @options.key?(:foreign_key)
          @options[:foreign_key].to_sym
        elsif @name.to_s == @name.to_s.pluralize
          "#{@name.to_s.singularize}_ids".to_sym
        else
          "#{@name}_id".to_sym
        end
      end
    end
  end
end
