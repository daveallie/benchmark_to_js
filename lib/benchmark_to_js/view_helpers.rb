module BenchmarkToJs
  module ViewHelpers
    def benchmark_to_js(name = 'block', &block)
      if BenchmarkToJs.configuration.run?
        ret = ''
        time = Benchmark.ms {ret = capture(&block)}

        message = if BenchmarkToJs.configuration.pretty
          color = if time >= BenchmarkToJs.configuration.red_threshold
            'red'
          elsif time >= BenchmarkToJs.configuration.orange_threshold
            'darkorange'
          else
            'green'
          end

          %Q("%c #{escape_javascript(name)} %c ran in %c#{time.round(5)}ms", 'background: #222; color: #bada55', '', 'color:#{color}')
        else
          %Q("'#{escape_javascript(name)}' ran in #{time.round(5)}ms")
        end

        options = BenchmarkToJs.configuration.tag_options.respond_to?(:call) ? BenchmarkToJs.configuration.tag_options.call(self) : nil
        (ret || '') + javascript_tag(%Q(console.log(#{message})), options)
      else
        capture(&block)
      end
    end
  end
end
