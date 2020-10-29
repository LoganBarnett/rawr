lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rawr/rawr_version'

Gem::Specification.new do |spec|
  spec.name          = 'rawr'
  spec.version       = Rawr::VERSION
  spec.authors       = ['Logan Barnett']
  spec.email         = ['logustus@gmail.com']

  spec.summary       = 'A build tool for JRuby standalone executables.'
  spec.description   = <<~HERE
Rawr produces a variety of executables (jar, .exe, .app, etc) for JRuby
applications such that the only requirement on the host is Java.
  HERE
  spec.homepage      = 'https://github.com/LoganBarnett/rawr'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.platform = 'java'

  # hoe was listed as 3.22.1 but it doesn't appear to be used.

  # No version listed.
  spec.add_runtime_dependency 'rubyzip'
  # No version listed.
  spec.add_runtime_dependency 'user-choices'
  # Was 3.2.4.
  spec.add_runtime_dependency 'builder'
  # Was 3.8.3.
  spec.add_runtime_dependency 'bones'
  spec.add_development_dependency 'bump', '~> 0.10'
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'geminabox', '~> 1.2'
  # Was 10.5.0.
  spec.add_development_dependency 'rake', '~> 13.0'
  # Was 1.3.0.
  spec.add_development_dependency 'rspec', '~> 3.9'

  spec.extensions = %w[Rakefile]
end
