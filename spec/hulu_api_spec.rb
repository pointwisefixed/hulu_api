$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'hulu_api'
require 'rspec'


describe Hulu do
	
	before :all do 
		@hulu = Hulu.new
	end

	it 'Should return at least one for this show', '#search' do
		results = @hulu.search "masterchef"
		expect(results[:count].to_i).to be  >= 10
	end
end
