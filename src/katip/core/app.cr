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

        rescue ex
          puts "********************************************************"
          puts "Error until create directory please control your path!"
          puts "Path format must be;"
          puts "dir1/dir2/dir3..."
          puts "Your path is"
          puts @config.path
          puts "--------------------------------------------------------"
          puts ex.message
          puts "********************************************************"
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

        rescue CanNotLogException
          puts "********************************************************"
          puts "Directories is created again!"
          init_app
          puts "Create is done!"
          puts "********************************************************"
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

        rescue CanNotLogException
          puts "********************************************************"
          puts "Directories is created again!"
          init_app
          puts "Create is done!"
          puts "********************************************************"
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

        rescue CanNotLogException
          puts "********************************************************"
          puts "Directories is created again!"
          init_app
          puts "Create is done!"
          puts "********************************************************"
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

        rescue CanNotLogException
          puts "********************************************************"
          puts "Directories is created again!"
          init_app
          puts "Create is done!"
          puts "********************************************************"
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

        rescue CanNotLogException
          puts "********************************************************"
          puts "Directories is created again!"
          init_app
          puts "Create is done!"
          puts "********************************************************"
      end
    end
  end
end
