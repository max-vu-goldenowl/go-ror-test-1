# frozen_string_literal: true

class Resolver
  def sum_up(desired_sum, arr)
    result = []
    return 'Please provide an array!' unless arr.is_a?(Array)

    arr.each do |ele|
      ele2 = desired_sum - ele

      result << [ele, ele2].sort if arr.include?(ele2) && ele2 != ele
    end

    "f(#{desired_sum}, #{arr}) -> #{result.uniq}"
  end
end
