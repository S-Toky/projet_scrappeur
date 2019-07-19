
require 'nokogiri'
require 'open-uri'


def symbol

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	crypto_name_array =[]
	crypto_price_array =[]
	final_result = []

	page.xpath('//tbody//td[@class="text-left col-symbol"]').each do |name|
		crypto_name_array << name.text
	end
	
	page.xpath('//*[@class="price"]').each do |price|
		crypto_price_array << price.text
	end
 		crypto_name_array.length.times do |i|
        final_result << {crypto_name_array[i] => crypto_price_array[i]}
    end
       if final_result != nil
        return true
    else
        return false
    end
end

