<img src="https://cloud.githubusercontent.com/assets/11555504/25776661/675cef36-32cd-11e7-9ab8-14a2a7228198.png" width="50" height="50" />

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

And basic log it!

```crystal
logger.debug("Debug mode is on!")

logger.info("Information! This is log.")

logger.warn("Warning! Please control your code.")

logger.error("Error! Please fix and re-compile it!")

logger.fatal("Fatal! OH NO!")
```

if you want log detail, you can use this methods.

```crystal
logger.debug("Debug mode is on!", self, YourExceptionName)

logger.info("Information! This is log.", self, YourExceptionName)

logger.warn("Warning! Please control your code.", self, YourExceptionName)

logger.error("Error! Please fix and re-compile it!", self, YourExceptionName)

logger.fatal("Fatal! OH NO!", self, YourExceptionName)
```

## JSON Output

Please do not edit manuel JSON log files! 

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

## View Your Logs

You can use katipviewer.html to control your logs.

Open katipviewer.html on local machine.

<img src="https://cloud.githubusercontent.com/assets/11555504/25783981/0f728870-336e-11e7-85e2-f815f6c523e9.png" width="650" height="450" />

Choose your log json file.

<img src="https://cloud.githubusercontent.com/assets/11555504/25783983/12f79936-336e-11e7-8e13-995e61a394ff.png" width="650" height="450" />

Click Read JSON Log button.

<img src="https://cloud.githubusercontent.com/assets/11555504/25783982/10eea904-336e-11e7-9f2d-e5889ef64701.png" width="650" height="450" />


## Contributing

1. Fork it ( https://github.com/guvencenanguvenal/katip/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [guvencenanguvenal](https://github.com/guvencenanguvenal) Güven Cenan Güvenal - creator, maintainer
