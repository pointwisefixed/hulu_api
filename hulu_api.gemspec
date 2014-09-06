Gem::Specification.new do |s|
	s.name				= "hulu-api"
	s.version			= "1.0.1"
	s.files				= ["lib/hulu_api.rb", "lib/hulu_api/hulu_api.rb"]
	s.license			= "MIT"
	s.summary			= "A Hulu API port the unofficial Hulu API PHP"
	s.authors			= ['Gary Rosales']
	s.email				= "pwfixed@garyrosales.com"
	s.homepage			= "https://github.com/pointwisefixed/hulu_api"
	s.description		= "A Hulu API port of the unofficial Hulu API PHP library"
	s.add_runtime_dependency 'curb', '~> 0.8', '>= 0.8.6'
	s.add_runtime_dependency 'simple-xml', '~> 1.0', '>= 1.0.0'	
end

