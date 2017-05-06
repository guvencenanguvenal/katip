module Katip
  module Core
    class Appender
      def initialize(@config : Config)
      end 

      def log(obj_class : Object.class, text : String, ex : Exception, loglevel : LogLevel)
        if @config.logclassification == LogClassification::DATE_DAY.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification == LogClassification::DATE_MINUTES.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:#{Time.now.minute}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification == LogClassification::DATE_HOUR.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.now.year}-#{Time.now.month}-#{Time.now.day}|#{Time.now.hour}:00.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification == LogClassification::DATE_MONTH.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.now.year}-#{Time.now.month}-01.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification == LogClassification::LOGLEVEL.value
            Core::Engine.add_error_log_json("#{@config.path}/#{loglevel}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification == LogClassification::EXCEPTION.value
            Core::Engine.add_error_log_json("#{@config.path}/#{ex.class}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification == LogClassification::CLASS.value
            Core::Engine.add_error_log_json("#{@config.path}/#{obj_class}.json", Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        end

        rescue CanNotLogException
            raise CanNotLogException.new
        rescue Exception
            puts "********************************************************"
            puts "I am finding unknown Exception! Please create issue on https://github.com/guvencenanguvenal/katip/issues"
            puts "********************************************************"
      end
    end
  end
end
