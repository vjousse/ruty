require 'rubygems'

SPEC = Gem::Specification.new do |s|
    s.name     = "ruty"
    s.version  = "0.0.1"
    s.author   = "Armin Ronacher"
    s.platform = Gem::Platform::RUBY
    s.summary  = "A Template-Engine inspired by the jinja engine"
    candidates = Dir.glob("{lib}/**/*")
    s.files    = candidates.delete_if do |item|
                item.include?("rdoc") || item.include?(".svn")
                end
    candidates = Dir.glob("{tests}/**/*")
    s.test_files = candidates.delete_if do |item|
		item.include?("rdoc") || item.include?(".svn")
		end
    s.require_path = "lib"
    s.has_rdoc     = "true"
  # s.extra_rdoc_files = ["README"]
end
