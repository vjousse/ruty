require 'ruty'
require 'erb'
require 'benchmark'

loader = Ruty::Loaders::Filesystem.new(:dirname => '.')

context = {
  :title =>     "<foo>",
  :sequence =>  (1..1000).to_a,
}

class MyTemplate

  def initialize
    f = File.new('erb.html')
    @template = ERB.new(f.read)
    f.close
  end

  def escape value, attribute=false
    value = value.to_s.gsub(/&/, '&amp;')\
                      .gsub(/>/, '&gt;')\
                      .gsub(/</, '&lt;')
    value.gsub!(/"/, '&quot;') if attribute
    value
  end

  def render context
    @template.result(binding)
  end

end

n = 50
rutyt = erbt = nil

Benchmark.bm do |b|
  b.report('ruty load') {
    n.times {
      rutyt = loader.get_template('ruty.html')
    }
  }
  b.report('erb load') {
    n.times {
      erbt = MyTemplate.new
    }
  }
  b.report('ruty render') {
    n.times {
      rutyt.render(context)
    }
  }
  b.report('erb render') {
    n.times {
      erbt.render(context)
    }
  }
end
