Gem::Specification.new do |s|
	s.name				= "Hulu API"
	s.version			= "1.0.0"
	s.files				= "lib/hulu_api.rb"
	s.license			= "MIT"
	s.summary			= "A Hulu API port the unofficial Hulu API PHP"
	s.authors			= ['Gary Rosales']
	s.email				= "pwfixed@garyrosales.com"
	s.homepage			= "http://"
	s.description		= "A Hulu API port of the unofficial Hulu API PHP library"
	s.add_dependency "curb", "~> 0.8.6"
	s.add_dependency "simple-xml", ">= 1.0.0"
end

