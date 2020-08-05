require_relative '../models/init'

class FruitController
 
    def get_fruit(fruitId)
        #
    end

    def set_fruit(params)
        Fruit.insert(name: params["name"], amount: params["amount"])
        puts Fruit.count
        true
    end

    def delete_fruit(fruitId)
        #
    end

end