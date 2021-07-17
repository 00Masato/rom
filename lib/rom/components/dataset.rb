# frozen_string_literal: true

require_relative "core"

module ROM
  module Components
    # @api public
    class Dataset < Core
      # @api public
      def build
        if gateway?
          blocks.reduce(gateway.dataset(id)) { |ds, blk|
            ds.instance_exec(schema, &blk)
          }
        elsif block
          schema ? block.(schema) : block.()
        else
          EMPTY_ARRAY
        end
      end

      # @api private
      def blocks
        [block, *datasets.map(&:block)].compact
      end

      # @api public
      def abstract
        config[:abstract]
      end

      # @api adapter
      def adapter
        config[:adapter]
      end

      private

      # @api private
      def datasets
        # TODO: ensure abstract components don't get added multiple times
        provider.components.datasets(abstract: true, adapter: adapter).uniq(&:id).select { |ds| ds.id != id }
      end

      # @api private
      def schema
        resolver.schemas[schema_key] if schema_key
      end

      # @api private
      def schema_key
        resolver.components.get(:schemas, id: id)&.key
      end
    end
  end
end
