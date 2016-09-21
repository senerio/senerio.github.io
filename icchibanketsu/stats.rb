require 'open-uri'
require 'nokogiri'

labels = ["health", "attack", "magic", "defense", "resistance", "soul", "luck", "agility", "critical", "dodge"]

namejp = "div:nth-child(2) > table > tbody > tr:nth-child(2) > td:nth-child(3)"

basic_health = "div:nth-child(2) > table > tbody > tr:nth-child(11) > td:nth-child(2)"
basic_attack = "div:nth-child(2) > table > tbody > tr:nth-child(12) > td:nth-child(2)"
basic_magic = "div:nth-child(2) > table > tbody > tr:nth-child(13) > td:nth-child(2)"
basic_defense = "div:nth-child(2) > table > tbody > tr:nth-child(14) > td:nth-child(2)"
basic_resistance = "div:nth-child(2) > table > tbody > tr:nth-child(15) > td:nth-child(2)"
basic_soul = "div:nth-child(2) > table > tbody > tr:nth-child(11) > td:nth-child(4)"
basic_luck = "div:nth-child(2) > table > tbody > tr:nth-child(12) > td:nth-child(4)"
basic_agility = "div:nth-child(2) > table > tbody > tr:nth-child(13) > td:nth-child(4)"
basic_critical = "div:nth-child(2) > table > tbody > tr:nth-child(14) > td:nth-child(4)"
basic_dodge = "div:nth-child(2) > table > tbody > tr:nth-child(15) > td:nth-child(4)"

yang_health = "#rgn_content2 > div > table > tbody > tr:nth-child(5) > td:nth-child(2)"
yang_attack = "#rgn_content2 > div > table > tbody > tr:nth-child(6) > td:nth-child(2)"
yang_magic = "#rgn_content2 > div > table > tbody > tr:nth-child(7) > td:nth-child(2)"
yang_defense = "#rgn_content2 > div > table > tbody > tr:nth-child(8) > td:nth-child(2)"
yang_resistance = "#rgn_content2 > div > table > tbody > tr:nth-child(9) > td:nth-child(2)"
yang_soul = "#rgn_content2 > div > table > tbody > tr:nth-child(5) > td:nth-child(4)"
yang_luck = "#rgn_content2 > div > table > tbody > tr:nth-child(6) > td:nth-child(4)"
yang_agility = "#rgn_content2 > div > table > tbody > tr:nth-child(7) > td:nth-child(4)"
yang_critical = "#rgn_content2 > div > table > tbody > tr:nth-child(8) > td:nth-child(4)"
yang_dodge = "#rgn_content2 > div > table > tbody > tr:nth-child(9) > td:nth-child(4)"

yin_health = "#rgn_content2 > div > table > tbody > tr:nth-child(5) > td:nth-child(6)"
yin_attack = "#rgn_content2 > div > table > tbody > tr:nth-child(6) > td:nth-child(6)"
yin_magic = "#rgn_content2 > div > table > tbody > tr:nth-child(7) > td:nth-child(6)"
yin_defense = "#rgn_content2 > div > table > tbody > tr:nth-child(8) > td:nth-child(6)"
yin_resistance = "#rgn_content2 > div > table > tbody > tr:nth-child(9) > td:nth-child(6)"
yin_soul = "#rgn_content2 > div > table > tbody > tr:nth-child(5) > td:nth-child(8)"
yin_luck = "#rgn_content2 > div > table > tbody > tr:nth-child(6) > td:nth-child(8)"
yin_agility = "#rgn_content2 > div > table > tbody > tr:nth-child(7) > td:nth-child(8)"
yin_critical = "#rgn_content2 > div > table > tbody > tr:nth-child(8) > td:nth-child(8)"
yin_dodge = "#rgn_content2 > div > table > tbody > tr:nth-child(9) > td:nth-child(8)"

def getpage (url,id)
	page = Nokogiri::HTML(open(url)).css("#"+id)
	return page
end

def getstats (url)
	page = getpage(url,"body")
	stats = {}
	["basic", "yang", "yin"].each do |version|
		stats[version] = {}
		labels.each do |label|
			stats[version][label] = page.css(version+"_"+label)
		end
	end
	return stats
end

ARGV.each do |url|
	puts page.css(namejp).text
	puts page.css(yin_dodge).text
	puts page.css(yang_dodge).text
end