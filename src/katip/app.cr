require "file"
require "file_utils"

module Katip
  class App

    def initialize
      if !File.directory?(Config.path)
        FileUtils.mkdir(Config.path)
      end

      @appender = Core::Appender.new

      # :TODO Create directories
    end

    ###
    # DEBUG
    #
    ###
    def debug_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel.value < LogLevel::DEBUG.value
        # :TODO
        @appender.log(obj_class, text, ex, LogLevel::DEBUG)
      end
    end

    ###
    # INFO
    #
    ###
    def info_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel.value < LogLevel::INFO.value
        # :TODO
        @appender.log(obj_class, text, ex, LogLevel::INFO)
      end
    end

    ###
    # WARN
    #
    ###
    def warn_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel.value < LogLevel::WARN.value
        # :TODO
        @appender.log(obj_class, text, ex, LogLevel::WARN)
      end
    end

    ###
    # ERROR
    #
    ###
    def error_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel.value < LogLevel::ERROR.value
        # :TODO
        @appender.log(obj_class, text, ex, LogLevel::ERROR)
      end
    end

    ###
    # FATAL
    #
    ###
    def fatal_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel.value < LogLevel::FATAL.value
        # :TODO
        @appender.log(obj_class, text, ex, LogLevel::FATAL)
      end
    end
  end
end
