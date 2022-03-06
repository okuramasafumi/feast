# frozen_string_literal: true

require 'json'

module Feast
  # API class represents a set of APIs
  # This class is also a rack app but this might change in the future
  class API
    # `@results` variable stores results for all paths
    def initialize
      @results = {}
    end

    # Accepts GET request
    #
    # @param route [String]
    def get(route)
      @results[route] = yield
      self
    end

    # rubocop:disable Style/StringHashKeys
    # rack app convention
    #
    # @param env [Rack::ENV]
    def call(env)
      path_info = env['PATH_INFO']
      result = @results[path_info] || ''
      [200, { 'ContentType' => 'application/json' }, [result]]
    end
    # rubocop:enable Style/StringHashKeys
  end
end
