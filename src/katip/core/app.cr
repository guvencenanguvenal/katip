require "file"
require "file_utils"

module Katip
  module Core
    class App

      ###
      #
      ###
      private def init_app
        _file_path = @config.path.split("/")
        _file_path_next = ""

        _file_path.each do |path|
          if _file_path_next == ""
            _file_path_next = path
          else
            _file_path_next += "/" + path
          end

          if !File.directory?(_file_path_next)
            FileUtils.mkdir(_file_path_next)
          end
        end
      end

      def initialize(@config : Config)
        init_app

        @appender = Core::Appender.new(@config)

        # :TODO Create directories
      end

      def configure(@config : Config)
        init_app
      end

      ###
      # DEBUG
      #
      ###
      def debug_logger(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
        if @config.loglevel.value <= LogLevel::DEBUG.value
          # :TODO
          @appender.log(obj_class, text, ex, LogLevel::DEBUG)
        end
      end

      ###
      # INFO
      #
      ###
      def info_logger(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
        if @config.loglevel.value <= LogLevel::INFO.value
          # :TODO
          @appender.log(obj_class, text, ex, LogLevel::INFO)
        end
      end

      ###
      # WARN
      #
      ###
      def warn_logger(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
        if @config.loglevel.value <= LogLevel::WARN.value
          # :TODO
          @appender.log(obj_class, text, ex, LogLevel::WARN)
        end
      end

      ###
      # ERROR
      #
      ###
      def error_logger(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
        if @config.loglevel.value <= LogLevel::ERROR.value
          # :TODO
          @appender.log(obj_class, text, ex, LogLevel::ERROR)
        end
      end

      ###
      # FATAL
      #
      ###
      def fatal_logger(text : String, obj_class = Object.class, ex = NotSetException.new("Not Init"))
        if @config.loglevel.value <= LogLevel::FATAL.value
          # :TODO
          @appender.log(obj_class, text, ex, LogLevel::FATAL)
        end
      end
    end
  end
end
