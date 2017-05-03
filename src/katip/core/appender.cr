module Katip
  module Core
    class Appender
      def log(obj_class : Object.class, text : String, ex : Exception, loglevel : LogLevel)
        if Config.logclassification == LogClassification::DATE_MINUTES.value
          if File.file?("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:#{Time.now.minute}.json")
            File.write("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:#{Time.now.minute}.json", Core::Engine.init_log())
          else
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:#{Time.now.minute}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
          end
        elsif Config.logclassification == LogClassification::DATE_HOUR.value
          if File.file?("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:00.json")
            File.write("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:00.json", Core::Engine.init_log())
          else
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:00.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
          end
        elsif Config.logclassification == LogClassification::DATE_DAY.value
          if File.file?("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}.json")
            File.write("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}.json", Core::Engine.init_log())
          else
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
          end
        elsif Config.logclassification == LogClassification::DATE_MONTH.value
          if File.file?("#{Config.path}/#{Time.now.year}-#{Time.now.month}-01.json")
            File.write("#{Config.path}/#{Time.now.year}-#{Time.now.month}-01.json", Core::Engine.init_log())
          else
            Core::Engine.add_error_log_json("#{Config.path}/#{Time.now.year}-#{Time.now.month}-01.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
          end
        elsif Config.logclassification == LogClassification::LOGLEVEL.value
          if File.file?("#{Config.path}/#{loglevel}.json")
            File.write("#{Config.path}/#{loglevel}.json", Core::Engine.init_log())
          else
            Core::Engine.add_error_log_json("#{Config.path}/#{loglevel}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
          end
        elsif Config.logclassification == LogClassification::EXCEPTION.value
          if File.file?("#{Config.path}/#{ex.class}.json")
            File.write("#{Config.path}/#{ex.class}.json", "")
          else
            Core::Engine.add_error_log_json("#{Config.path}/#{ex.class}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
          end
        elsif Config.logclassification == LogClassification::CLASS.value
          if File.file?("#{Config.path}/#{obj_class}.json")
            File.write("#{Config.path}/#{obj_class}.json", Core::Engine.init_log())
          else
            Core::Engine.add_error_log_json("#{Config.path}/#{obj_class}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
          end
        end
      end
    end
  end
end
