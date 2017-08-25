require 'mocha/debug'

module Mocha

  class Deprecation

    class << self

      attr_accessor :mode, :messages

      def warning(message)
        @messages << message
        unless mode == :disabled
          $stderr.puts "Mocha deprecation warning: #{message}"
        end
        if mode == :debug
          $stderr.puts caller.join("\n  ")
        end
      end

    end

    self.mode = Debug::OPTIONS['debug'] ? :debug : :enabled
    self.messages = []

  end

end
