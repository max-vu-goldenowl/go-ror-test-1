# frozen_string_literal: true

require 'minitest/autorun'
require './resolver'

class ResolverTest < Minitest::Test
  def test_sum_up_returns_error_message
    resolver = Resolver.new
    result = resolver.sum_up(10, 1)

    assert result == 'Please provide an array!'
  end

  def test_sum_up_returns_empty_array
    resolver = Resolver.new
    result = resolver.sum_up(10, [1, 2, 3])

    assert result == 'f(10, [1, 2, 3]) -> []'
  end

  def test_sum_up_returns_existing_array
    resolver = Resolver.new
    result1 = resolver.sum_up(10, [3, 4, 5, 6, 7, 8])
    result2 = resolver.sum_up(11, [3, 4, 5, 6, 7, 8])
    result3 = resolver.sum_up(6, [1, 2, 3, 4, 5])
    result4 = resolver.sum_up(7, [1, 2, 3, 4, 5, 6])

    assert result1 == 'f(10, [3, 4, 5, 6, 7, 8]) -> [[3, 7], [4, 6]]'
    assert result2 == 'f(11, [3, 4, 5, 6, 7, 8]) -> [[3, 8], [4, 7], [5, 6]]'
    assert result3 == 'f(6, [1, 2, 3, 4, 5]) -> [[1, 5], [2, 4]]'
    assert result4 == 'f(7, [1, 2, 3, 4, 5, 6]) -> [[1, 6], [2, 5], [3, 4]]'
  end
end
