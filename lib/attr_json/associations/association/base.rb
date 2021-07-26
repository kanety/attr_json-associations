# frozen_string_literal: true

module AttrJson::Associations
  module Association
    class Base
      attr_accessor :owner, :name, :scope, :options
      attr_accessor :class_name, :klass, :primary_key, :foreign_key

      def initialize(owner, args, options = {})
        @owner = owner
        @name = args[0]
        @scope = args[1]
        @options = options

        @class_name = resolve(:class_name)
        @klass = @class_name.constantize
        @primary_key = resolve(:primary_key)
        @foreign_key = resolve(:foreign_key)
      end

      def scoped
        if @scope
          @klass.all.instance_exec(&@scope)
        else
          @klass.all
        end
      end

      private

      def resolve(key)
        if @options.key?(key)
          @options[key].to_s
        else
          send("resolve_#{key}")
        end
      end

      def resolve_class_name
        [@owner.name.deconstantize, @name.to_s.demodulize.classify].select(&:present?).join('::')
      end

      def resolve_primary_key
      end

      def resolve_foreign_key
      end
    end
  end
end
