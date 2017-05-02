module Katip
  class App

    def initialize
      # :TODO Create json files and directories
    end

    ###
    #
    #
    ###
    def debug_logger
      if Config::LOGLEVEL < LogLevel::DEBUG.value
        # :TODO
      end
    end

    ###
    #
    #
    ###
    def info_logger
      if Config::LOGLEVEL < LogLevel::INFO.value
        # :TODO
      end
    end

    ###
    #
    #
    ###
    def warn_logger
      if Config::LOGLEVEL < LogLevel::WARN.value
        # :TODO
      end
    end

    ###
    #
    #
    ###
    def error_logger
      if Config::LOGLEVEL < LogLevel::ERROR.value
        # :TODO
      end
    end

    ###
    #
    #
    ###
    def fatal_logger
      if Config::LOGLEVEL < LogLevel::FATAL.value
        # :TODO
      end
    end
  end
end
