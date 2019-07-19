require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)

	page = Nokogiri::HTML(open(townhall_url))
	email = page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
		return email.text
end
def get_townhall_urls
	town_list = []
	tab_lien = []
	page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
	page.xpath('//a[@class = "lientxt"]').each do |town|
		a = town['href']
		longeur = a.length
		tab_lien << "https://www.annuaire-des-mairies.com"+a[1...longeur]
		town_list << town.text
	end
	return tab_lien, town_list #lien akana mail de liste na village
end

def fusion
	email_list = []
	email_link , name_town = get_townhall_urls
	hash_info = []
	email_link.length.times do |i|
		email_list << get_townhall_email(email_link[i])
		hash_info << {name_town[i] => email_list[i]}
	end
	return hash_info
end

puts fusion
