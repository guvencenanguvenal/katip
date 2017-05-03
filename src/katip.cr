require "./katip/classextention/*"
require "./katip/*"
require "./katip/core/*"

module Katip
    class Logger

        def initialize
            @app = App.new
        end

        ###
        #
        #
        ###
        def debug(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
            @app.debug_logger(text, obj_class, ex)
        end

        ###
        #
        #
        ###
        def info(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
            @app.info_logger(text, obj_class, ex)
        end

        ###
        #
        #
        ###
        def warn(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
            @app.warn_logger(text, obj_class, ex)
        end

        ###
        #
        #
        ###
        def error(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
            @app.error_logger(text, obj_class, ex)
        end

        ###
        #
        #
        ###
        def fatal(text : String, obj_class = Object.class, ex = Exception.new("Not Init"))
            @app.fatal_logger(text, obj_class, ex)
        end
    end
end
