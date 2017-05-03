require "./katip/classextention/*"
require "./katip/*"

module Katip
    class Logger
        INSTANCE = Logger.new

        def initialize
            @app = App.new
        end

        ###
        #
        #
        ###
        def self.debug(text : String)
            @app.debug_logger(text)
        end

        ###
        #
        #
        ###
        def self.debug(text : String, ex : Exception)
            @app.debug_logger(text, ex)
        end

        ###
        #
        #
        ###
        def self.debug(obj_class : Object.class, text : String, ex : Exception)
            @app.debug_logger(obj_class, text, ex)
        end

        ###
        #
        #
        ###
        def self.info(text : String)
            @app.info_logger(text)
        end 

        ###
        #
        #
        ###
        def self.info(text : String, ex : Exception)
            @app.info_logger(text, ex)
        end 

        ###
        #
        #
        ###
        def self.info(obj_class : Object.class, text : String, ex : Exception)
            @app.info_logger(obj_class, text, ex)
        end

        ###
        #
        #
        ###
        def self.warn(text : String)
            @app.warn_logger(text)
        end

        ###
        #
        #
        ###
        def self.warn(text : String, ex : Exception)
            @app.warn_logger(text, ex)
        end

        ###
        #
        #
        ###
        def self.warn(obj_class : Object.class, text : String, ex : Exception)
            @app.warn_logger(obj_class, text, ex)
        end

        ###
        #
        #
        ###
        def self.error(text : String)
            @app.error_logger(text)
        end

        ###
        #
        #
        ###
        def self.error(text : String, ex : Exception)
            @app.error_logger(text, ex)
        end

        ###
        #
        #
        ###
        def self.error(obj_class : Object.class, text : String, ex : Exception)
            @app.error_logger(obj_class, text, ex)
        end

        ###
        #
        #
        ###
        def self.fatal(text : String)
            @app.fatal_logger(text)
        end

        ###
        #
        #
        ###
        def self.fatal(text : String, ex : Exception)
            @app.fatal_logger(text, ex)
        end

        ###
        #
        #
        ###
        def self.fatal(obj_class : Object.class, text : String, ex : Exception)
            @app.fatal_logger(obj_class, text, ex)
        end
    end
end
