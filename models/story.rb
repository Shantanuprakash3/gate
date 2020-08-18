require_relative 'db'

class Stories < Sequel::Model
    one_to_many :sentences
    dataset_module do
        def get_incomplete max_words
           where{word_count < max_words}
        end
        def get_by_id story_id
            where{story_id == story_id}
        end

        def inc_word_count story_id
            where(:story_id => story_id).update(:word_count => Sequel[:word_count] + 1, :updated_at => Time.now)
        end
    end
    # def before_create
    #     self.created_at ||= Time.now
    #     super
    # end
    def after_update
        self.word_count+=1
        self.updated_at ||= Time.now
        yield
        super
    end
end
