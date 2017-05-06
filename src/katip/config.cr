module Katip
  class Config
    property loglevel = LogLevel::ALL

    property dateformat = "dd\mm\yyyy"
    property logclassification : Int32 = LogClassification::DATE_DAY.value

    property path = "src/katipdeneme/logfiles"
  end
end
