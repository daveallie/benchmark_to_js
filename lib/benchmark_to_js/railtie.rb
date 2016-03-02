require 'benchmark_to_js/view_helpers'
module BenchmarkToJs
  class Railtie < Rails::Railtie
    initializer 'benchmark_to_js.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
