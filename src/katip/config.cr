module Katip
  class Config
    class_property loglevel = LogLevel::ALL

    class_property dateformat = "dd\mm\yyyy"
    class_property logclassification : Int32 = LogClassification::DATE_DAY.value

    class_property path = "src/katipdeneme/logfiles"
  end
end
