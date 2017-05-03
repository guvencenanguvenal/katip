require "file"
require "fileutils"

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
      if Config.loglevel < LogLevel::DEBUG.value
        # :TODO
        @appender.log(obj_class, text, ex)
      end
    end

    ###
    # INFO
    #
    ###
    def info_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel < LogLevel::INFO.value
        # :TODO
        @appender.log(obj_class, text, ex)
      end
    end

    ###
    # WARN
    #
    ###
    def warn_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel < LogLevel::WARN.value
        # :TODO
        @appender.log(obj_class, text, ex)
      end
    end

    ###
    # ERROR
    #
    ###
    def error_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel < LogLevel::ERROR.value
        # :TODO
        @appender.log(obj_class, text, ex)
      end
    end

    ###
    # FATAL
    #
    ###
    def fatal_logger(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
      if Config.loglevel < LogLevel::FATAL.value
        # :TODO
        @appender.log(obj_class, text, ex)
      end
    end
  end
end
