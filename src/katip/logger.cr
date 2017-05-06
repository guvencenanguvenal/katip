module Katip
  class Logger
      property config : Config
      
      def initialize
          @config = Config.new
          @app = Core::App.new(@config)
      end

      def configure
        yield @config
        @app.configure @config

        self
      end

      ###
      #
      #
      ###
      def debug(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
          @app.debug_logger(text, obj_class, ex)
      end

      ###
      #
      #
      ###
      def info(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
          @app.info_logger(text, obj_class, ex)
      end

      ###
      #
      #
      ###
      def warn(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
          @app.warn_logger(text, obj_class, ex)
      end

      ###
      #
      #
      ###
      def error(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
          @app.error_logger(text, obj_class, ex)
      end

      ###
      #
      #
      ###
      def fatal(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
          @app.fatal_logger(text, obj_class, ex)
      end
    end
end
