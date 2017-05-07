module Katip
  module Core
    class Engine
      def self.add_error_log_json(filename : String, json_init_info : String, json : String)
        if !File.file?(filename)
          File.write(filename, json_init_info)
          _file_io = File.read(filename)
          _file_io = _file_io.rchop("]}")
          File.write(filename, _file_io + json + "}]}")
        else
          _file_io = File.read(filename)
          _file_io = _file_io.rchop("]}")
          File.write(filename, _file_io + "," + json + "}]}")
        end

        rescue
          puts "********************************************************"
          puts "Error! I can not create your log file!"
          puts "Please control your path!"
          puts "--- Another trick;"
          puts "Log file may already open or may use anoter program!"
          puts "********************************************************"
          raise CanNotLogException.new
      end

      def self.create_log_json(obj_class : Object.class, text : String, ex : Exception, loglevel : LogLevel) : String
        _log_level = ""
        
        case loglevel.value
        when LogLevel::ALL.value
          _log_level = "ALL"
        when LogLevel::DEBUG.value
          _log_level = "DEBUG"
        when LogLevel::INFO.value
          _log_level = "INFO"
        when LogLevel::WARN.value
          _log_level = "WARN"
        when LogLevel::ERROR.value
          _log_level = "ERROR"
        when LogLevel::FATAL.value
          _log_level = "FATAL"
        end

        "{\"date\":\"#{Time.now}\", \"class\":\"#{obj_class}\", \"message\":\"#{text}\", \"exception_type\":\"#{ex.class}\", \"exception_message\":\"#{ex.message}\", \"log_level\":\"#{_log_level}\""
      end
    end
  end
end
