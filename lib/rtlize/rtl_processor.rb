module Rtlize
  class RtlProcessor
    attr_reader :data

    def initialize(file, &block)
      @data = block.call
    end

    def render(context, locals, &block)
      if context.pathname.basename.to_s.match(/\.rtl\.s?css/i)
        Rtlize::RTLizer.transform(data)
      else
        data
      end
    end
  end
end
