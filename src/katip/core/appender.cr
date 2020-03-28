module Katip
  module Core
    class Appender
      def initialize(@config : Config)
        @json_init_info = "{\"katip\":\"#{VERSION}\",\"info\":{\"description\":\"#{@config.info.description}\",\"project\":\"#{@config.info.project}\",\"version\":\"#{@config.info.version}\"},\"errors\":["
      end 

      def log(obj_class : Object.class, text : String, ex : Exception, loglevel : LogLevel)
        if @config.logclassification.value == LogClassification::DATE_DAY.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.local.year}-#{Time.local.month}-#{Time.local.day}.json", @json_init_info, Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification.value == LogClassification::DATE_MINUTES.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.local.year}-#{Time.local.month}-#{Time.local.day}|#{Time.local.hour}:#{Time.local.minute}.json", @json_init_info, Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification.value == LogClassification::DATE_HOUR.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.local.year}-#{Time.local.month}-#{Time.local.day}|#{Time.local.hour}:00.json", @json_init_info, Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification.value == LogClassification::DATE_MONTH.value
            Core::Engine.add_error_log_json("#{@config.path}/#{Time.local.year}-#{Time.local.month}-01.json", @json_init_info, Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification.value == LogClassification::LOGLEVEL.value
            Core::Engine.add_error_log_json("#{@config.path}/#{loglevel}.json", @json_init_info, Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification.value == LogClassification::EXCEPTION.value
            Core::Engine.add_error_log_json("#{@config.path}/#{ex.class}.json", @json_init_info, Core::Engine.create_log_json(obj_class, text, ex, loglevel))
        elsif @config.logclassification.value == LogClassification::CLASS.value
            Core::Engine.add_error_log_json("#{@config.path}/#{obj_class}.json", @json_init_info, Core::Engine.create_log_json(obj_class, text, ex, loglevel))
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
