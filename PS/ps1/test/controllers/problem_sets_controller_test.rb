require 'test_helper'

class ProblemSetsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get problem_sets_index_url
    assert_response :success
  end
end
