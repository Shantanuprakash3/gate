require_relative '../../models/init'

class BlobHelper
    attr_accessor :story_id, :last_incomplete_blob
    def initialize story_id
        @story_id = story_id
        @last_incomplete_blob = nil
    end
    def create_blob word
        Storyblobs.insert(:story_id => @story_id, :story_blob => word)
        word
    end

    def update_blob word
        last_sentence = ""
        if fits_last_incomplete_blob? word
            Storyblobs.where(:story_id => @story_id).update(story_blob: @last_incomplete_blob[:story_blob]+','+word)
            Stories.inc_word_count @story_id
            last_sentence = @last_incomplete_blob[:story_blob] + ',' + word
        else
            last_sentence = create_blob word
        end
        last_sentence.split(",").join(" ")
    end

    def get_all_blobs
        Storyblobs.where(:story_id => @story_id).all.values
    end

    def fits_last_incomplete_blob? word
        last_sentence = Storyblobs.where(:story_id => @story_id).last
        return false if last_sentence.nil?
        @last_incomplete_blob = last_sentence.values
        if !@last_incomplete_blob.nil?
            temp = @last_incomplete_blob[:story_blob] + ',' + word
            if (temp.length>=255 || temp.split(",").count >= SENTENCE)
                return false
            end
        end
        true
    end

end