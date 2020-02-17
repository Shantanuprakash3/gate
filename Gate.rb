require_relative 'lib/parser.rb'

module GateModule
    include Parser
    def isAllowed (expr, feature, usr_hash)
        istrue = eval_expr(expr, usr_hash)
        istrue
    end
end
  
class Evaluate
    include GateModule
end



conditionalExpression = "age >= 25"

newEval = Evaluate.new
puts newEval.isAllowed(conditionalExpression, 'RewardA', {"name" => "shantanu", "age" => "25", "gender"=>"male","past_order_amount"=>"1888"})