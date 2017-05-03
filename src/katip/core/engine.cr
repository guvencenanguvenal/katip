require "json"
require "file"

module Katip
  module Core
    class Engine
      def self.init_log() : String
        "{\"katip\":\"#{VERSION}\",\"info\":{\"description\":\"\",\"project\":\"\",\"version\":\"\"},\"errors\":{}}"
      end

      def self.add_error_log_json(filename : String, json : String)
        _file_io = File.read(filename)
        _file_io.rchop("}}")
        File.write(filename, _file_io + json)
      end

      def self.create_log_json(obj_class : Object.class, text : String, ex : Exception, loglevel : LogLevel) : String
        _log_level = ""
        
        case loglevel
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

        "\"#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:#{Time.now.minute}:#{Time.now.second}\":{\"class\":\"#{obj_class}\", \"message\":\"#{text}\", \"exception_type\":\"#{ex.class}\", \"exception_message\":\"#{ex.message}\", \"log_level\":\"#{_log_level}\"}"
      end

    end
  end
end
