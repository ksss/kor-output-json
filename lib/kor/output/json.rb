require 'json'

if RUBY_VERSION <= "2.0.0"
  class Array
    def to_h
      Hash[self]
    end
  end
end

module Kor
  module Output
    class Json
      def initialize(io)
        @io = io
        @single = false
        @keys = []
        @values = []
        @count = 0
      end

      def io
        @io
      end

      def parse(opt)
        opt.on("--single", "All output join one JSON") do |arg|
          @single = arg
        end
      end

      def head(keys)
        @keys = keys
        @values = []
        if @single
          io.print '['
        end
      end

      def puts(values)
        if @single
          comma = @count == 0 ? "" : ","
          @count += 1
          io.print "#{comma}#{@keys.zip(values).to_h.to_json}"
        else
          io.puts @keys.zip(values).to_h.to_json
        end
      end

      def finish
        if @single
          io.puts "]"
        end
      end
    end
  end
end

require "kor/output/json/version"
