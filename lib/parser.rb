require 'scanf'
require_relative 'operator/operator.rb'

module Parser
    include Operator
    def eval_expr(expr, usr_hash)
        return expr if [true, false].include? expr

        l_operand, op, r_operand = expr.scanf('%s %s %s') 
        #puts "#{op}"
        if l_operand.nil?
            raise ArgumentError, "Missing or invalid left operand"
        end
    
        begin
            case op
                when 'and' then eval_expr(l_operand, usr_hash) && eval_expr(r_operand, usr_hash)
                when 'or' then eval_expr(l_operand, usr_hash) || eval_expr(r_operand, usr_hash)
                when ValidOp then evaluate(l_operand, r_operand, op, usr_hash)
            else raise ArgumentError, "Missing or invalid operator"
            end
        rescue TypeError
        raise ArgumentError, "Missing or invalid right operand"
        end
    end
end


class ValidOp
    def self.===(item)
      return ['>','>=','<=','<','BETWEEN'].include? item
    end
end
  