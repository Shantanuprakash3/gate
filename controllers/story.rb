require_relative '../models/init'
require_relative 'lib/init'
require 'yaml'

class StoryController
    attr_accessor :app_config, :blob_size
 
    def initialize
        @app_config = YAML.load(File.read(File.join(__dir__, 'config.yml')))
        max_words = @app_config["limits"]["sentence"] * @app_config["limits"]["paragraph"]* @app_config["limits"]["story"]
        @writerHelperObj = StoryWriterHelper.new @app_config["limits"]["sentence"]
        @readerHelperObj = StoryReaderHelper.new max_words
    end
    def add_word(word)
        incomplete_story = @readerHelperObj.get_incomplete_story
        if incomplete_story.nil?
            id, title, current_sentence = @writerHelperObj.create_new_story word
        else
            id = @writerHelperObj.story_id = incomplete_story[:story_id]
            title = incomplete_story[:title]
            title, current_sentence = @writerHelperObj.update_incomplete_story title, word
        end
        {
            "id": id,
            "title": title,
            "current_sentence": current_sentence
        }.to_json    
    end

    def get_all_stories filter
        @readerHelperObj.get_stories_by_filter filter

    end

    def get_story story_id
        @readerHelperObj.get_stories_by_id story_id
        
    end
end