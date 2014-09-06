class Hulu
	BASE_URL = 'http://m.hulu.com/'
	SEARCH_URL = 'http://m.hulu.com/search?dp_identifier=%s&query=%s&items_per_page=%d&page=%d'
	EMBED_CODE = '<iframe src="http://www.hulu.com/embed.html?eid=%s" width="%d" height="%d" frameborder="0" scrolling="no" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>'

	POSSIBLE_RETRIEVALS = {:shows => 'shows', :genres => 'channels', :companies => 'companies', :videos => 'videos'}

	def initialize(client_id = 'Hulu')
		@client_id = client_id
	end

	def http(url)
		ch = Curl::Easy.http_get url
		response = ch.body_str
		status = ch.status
		if(status.equal? "404 Not Found")
			raise "Failure to retrieve Hulu content"
		end
		response
	end

	def generate_url(type='', params={}) 
		url = "#{BASE_URL}/#{type}/?dp_id=#{@client_id}"
		params.each do |k,v|
			url << "&#{k}=#{v}"
		end
		url
	end

	def method_missing(symbol, *args)
		type_arg = POSSIBLE_RETRIEVALS[symbol.to_sym]
		if type_arg
			generate_url type_arg, *args
		end
	end
	
	def get_companies(params={})
		url = generate_url "companies", params
		http url
	end

	def get_embed_code(eid, width = 512, height = 288)
		sprintf EMBED_CODE, eid, width, height
	end

	def search(query, items_per_page=10, page=1)
		url = sprintf SEARCH_URL, @client_id, query, items_per_page, page
		puts url
		xml_str = http url
		r = to_json(xml_str)
	end

	def to_json(xml_str) 
		doc = REXML::Document.new(xml_str)
		doc.simplify("/results")
	end



end

