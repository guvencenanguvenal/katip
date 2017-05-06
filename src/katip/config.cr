module Katip
  class Config
    property loglevel = LogLevel::ALL
    property logclassification = LogClassification::DATE_DAY

    property path = "src/katipdeneme/logfiles"

    property info = Information.new
  end
end
