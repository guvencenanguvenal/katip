# katip

Katip is Logger for Crystal

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  katip:
    github: guvencenanguvenal/katip
```

## Usage

```crystal
require "katip"
```

Create your logger variable and configure it.

```crystal
logger = Katip::Logger.new

logger.configure do |config|
	config.loglevel = Katip::LogLevel::DEBUG
	config.classification = Katip::LogClassification::DATE_DAY
	config.path = "src/katip/logfiles"
	
	#### if you want to fill project's information
	config.info.description = "This is project description."
	config.info.project = "Module or project name."
	config.info.version = VERSION 	# project version
end
```

And log it!

```crystal
logger.debug("Debug mode is on!")

logger.info("Information! This is log.")

logger.warn("Warning! Please control your code.")

logger.error("Error! Please fix and re-compile it!")

logger.fatal("Fatal! OH NO!")
```

## JSON Output

```json
{
    "katip":"0.1.0",
    "info":{
        "description":"",
        "project":"",
        "version":""},
    "errors":{
        "636297026976169160":{
            "date":"2017-05-07 00:24:57 +0300", 
            "class":"Class", 
            "message":"Debug mode is on!", 
            "exception_type":"Katip::NotSetException", 
            "exception_message":"Not Init", 
            "log_level":"DEBUG"}
    }
}
```

## Contributing

1. Fork it ( https://github.com/guvencenanguvenal/katip/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [guvencenanguvenal](https://github.com/guvencenanguvenal) Güven Cenan Güvenal - creator, maintainer
