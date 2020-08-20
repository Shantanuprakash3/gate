require_relative '../../models/init'

class StoryReaderHelper < StoryHelper
    attr_accessor :incomplete_story, :max_words

    def initialize max_words
        @max_words = max_words
        @incomplete_story = nil
    end
    def get_incomplete_story
        incomplete_story = Stories.get_incomplete(@max_words)
        @incomplete_story = incomplete_story.first.values unless incomplete_story.nil?
    end
    def get_stories_by_filter filter
        response = {}
        start_id = response[:offset] = filter[:offset].nil? ? 0 : filter[:offset] 
        response[:limit] = filter[:limit].nil? ? 100 : filter[:limit]
        response[:count] = Stories.count
        response[:results] = []

        end_id = filter[:offset] + filter[:limit]
        stories = Stories.where(:story_id => start_id..end_id)
        filter_order = filter[:order].nil? ? 'asc' : filter[:order]
        filter_by = filter[:sort].nil? ? :created_at : filter[:sort].to_sym

        if filter_order == 'asc'
            stories = stories.order(filter_by)
        else
            stories = stories.reverse_order(filter_by)
        end
        stories.each do |story|
            story = story.to_hash
            temp = {
                :id => story[:story_id],
                :title => story[:title],
                :created_at => story[:created_at],
                :updated_at => story[:updated_at]
            }
            response[:results] << temp
        end
        response.to_json
    end

    def get_story_by_id story_id
        blobObj = BlobHelper.new story_id
        all_blobs = blobObj.get_all_blobs
   
    end
end