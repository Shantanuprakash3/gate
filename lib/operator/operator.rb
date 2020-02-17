module Operator
    def operatorAllowed (str)
        #puts "#{op}"
        @opObj = CustomOperator.get_new_evaluation(op)
    end

    def evaluate(lop, rop, op, usr_hash)
        #puts "#{op}"
        @opObj = GTE.new.get_new_evaluation(op)
        return @opObj.performEvaluation(lop,rop,op, usr_hash)
    end
end


class CustomOperator
    def get_new_evaluation (op)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end

    def performEvaluation (lop, rop)
    end
end
  

class GTE < CustomOperator
    def get_new_evaluation (op)
      return false if !['>','>='].include? op
      GTE.new
    end

    def performEvaluation (lop, rop,op, usr_hash)
        case op  
        when '>'
        return usr_hash[lop].to_i > rop.to_i
        when '>='
        return usr_hash[lop].to_i > rop.to_i || usr_hash[lop].to_i == rop.to_i
        else
        return false
        end 
    end
end
  

class LTE < CustomOperator
    def get_new_evaluation (op)
        return false if !['<','<='].include? op
        LTE.new
    end

    def performEvaluation (lop, rop)
    end
end

class Between < CustomOperator
    def get_new_evaluation (op)
        return false if !['BETWEEN'].include? op
        Between.new
    end

    def performEvaluation (lop, rop)
    end
end