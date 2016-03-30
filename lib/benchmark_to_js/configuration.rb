module BenchmarkToJs
  class Configuration
    attr_accessor :run_in_environments, :pretty, :orange_threshold, :red_threshold

    def initialize
      self.run_in_environments = [:development]
      self.pretty = true
      self.orange_threshold = 100
      self.red_threshold = 500
    end

    def run?
      @run ||= begin
        defined?(Rails) && Array(self.run_in_environments).map(&:to_s).include?(Rails.env)
      end
    end
  end

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end
end
