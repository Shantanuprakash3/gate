require_relative '../../models/init'

class StoryWriterHelper < StoryHelper
    attr_accessor :blob_size, :story_id
    def initialize blob_size
        @blob_size = blob_size
        @story_id = nil
    end

    def create_new_story word
        id = Stories.insert(title: word, word_count: 1)
        return id, word, ""
    end

    def update_incomplete_story title, word
        last_sentence = ""
        if is_unfinished_title? title
            title = update_story_title title, word
        else
            last_sentence = update_story_blob word
        end
        return title, last_sentence 
    end

    def update_story_title title, word
        title = title + " " + word
        Stories.where(:story_id => @story_id).update(:title => title, :word_count => Sequel[:word_count] + 1,:updated_at => Time.now)
        title
    end

    def update_story_blob word
        blobObj = BlobHelper.new story_id
        blobObj.update_blob word
    end

    def is_unfinished_title? title
        return title.split(",").length < 2 
    end
end