module Katip
  class Config
    @@loglevel = LogLevel::ALL.value

    @@dateformat = "dd\mm\yyyy"
    @@logclassification = LogClassification::DATE_DAY.value

    @@path = "./src/katip/logfiles"
  end
end
