require_relative 'db'

class Storyblobs < Sequel::Model
    many_to_one :stories
    dataset_module do
        def get_last_by_story story_id
           where(:story_id => story_id).last
        end
    end
    def after_update
        super
        Stories.where(:story_id => @story_id).update(:word_count => Sequel[:word_count] + 1, :updated_at => Time.now)
    end
end