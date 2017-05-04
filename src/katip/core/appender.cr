module Katip
  module Core
    class Appender
      def log(obj_class : Object.class, text : String, ex : Exception, loglevel : LogLevel)
        if Config.logclassification == LogClassification::DATE_DAY.value
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif Config.logclassification == LogClassification::DATE_MINUTES.value
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:#{Time.now.minute}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif Config.logclassification == LogClassification::DATE_HOUR.value
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:00.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif Config.logclassification == LogClassification::DATE_MONTH.value
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-01.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif Config.logclassification == LogClassification::LOGLEVEL.value
            Core::Engine.add_error_log_json("#{Config.path}/#{loglevel}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif Config.logclassification == LogClassification::EXCEPTION.value
            Core::Engine.add_error_log_json("#{Config.path}/#{ex.class}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif Config.logclassification == LogClassification::CLASS.value
            Core::Engine.add_error_log_json("#{Config.path}/#{obj_class}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        end
      end
    end
  end
end
