module AttrJson::Associations
  module Association
    class HasMany < Base
      def initialize(owner, args, options = {})
        super
      end

      private

      def resolve_primary_key
        if @options.key?(:primary_key)
          @options[:primary_key].to_sym
        else
          @owner.primary_key.to_sym
        end
      end

      def resolve_foreign_key
        if @options.key?(:foreign_key)
          @options[:foreign_key].to_sym
        else
          "#{@klass.to_s.demodulize.underscore}_id".to_sym
        end
      end
    end
  end
end
