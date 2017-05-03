module Katip
  enum LogLevel
    ALL
    DEBUG
    INFO
    WARN
    ERROR
    FATAL
    OFF
  end

  enum LogClassification
    DATE_MINUTES
    DATE_HOUR
    DATE_DAY
    DATE_WEEK
    DATE_MONTH
    LOGLEVEL
    EXCEPTION
    CLASS
  end
end
