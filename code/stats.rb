require 'json'
Path = File.expand_path("../../", __FILE__)
List = JSON.parse File.read(Path + "/files/list.json")
Skill = JSON.parse File.read(Path + "/files/skill.json")
Card = JSON.parse File.read(Path + "/master/MCard")
SkillDetail = JSON.parse File.read(Path + "/master/MCardSkill")

def getSM i
	s = (i.to_i + 10000).to_s
	m = (i.to_i + 20000).to_s
	return s,m
end

def getName x
	begin
		return x[0 .. x.index(" \(") - 1]
	rescue
		return x
	end
end

def profile_stats i
	def forRoute id, route
		s,m = getSM id
		case route
		when "Before"
			affix = ""
			i = id
		when "Sun"
			affix = "_s"
			i = s
		when "Moon"
			affix = "_m"
			i = m
		end
		puts "<!-- %s -->" % route
		puts "|rarity" + affix + " = " + Card[i]['rare']
		puts "|cost" + affix + " = " + Card[i]['cost'].to_s
		puts "|lvmax" + affix + " = " + Card[i]['baseMaxLevel'].to_s
		puts "|hp_base" + affix + " = " + Card[i]['baseHp'].to_s
		puts "|hp_max" + affix + " = " + Card[i]['maxHp'].to_s
		puts "|hp_break" + affix + " = " + Card[i]['limitBreakMaxHp'].to_s
		puts "|atk_base" + affix + " = " + Card[i]['baseAttackPoint'].to_s
		puts "|atk_max" + affix + " = " + Card[i]['maxAttackPoint'].to_s
		puts "|atk_break" + affix + " = " + Card[i]['limitBreakMaxAttackPoint'].to_s
		puts "|rp_base" + affix + " = " + Card[i]['baseRecoveryPoint'].to_s
		puts "|rp_max" + affix + " = " + Card[i]['maxRecoveryPoint'].to_s
		puts "|rp_break" + affix + " = " + Card[i]['limitBreakMaxRecoveryPoint'].to_s
		puts "|lskill_name" + affix + " = " + SkillDetail[LSkillId[i]]['skillName']
		puts "|lskill_desc" + affix + " = " + Skill[List[id]["no"]][route]["lskill"]
		puts "|skill_name" + affix + " = " + SkillDetail[SkillId[i]]['skillName']
		puts "|skill_desc" + affix + " = " + Skill[List[id]["no"]][route]["skill"]
		puts "|gold" + affix + " = " + Card[i]['baseSaleGold'].to_s
		puts "|ring" + affix + " = " + Card[i]['saleGrantItemNum'].to_s
	end
	puts "== Status =="
	puts "{{Infobox"
	puts "|no = " + List[i]['no']
	puts "|name = " + getName(List[i]['name'])
	puts "|name_jp = " + Card[i]['name']
	puts "|attribute = " + attr(Card[i]['attr'])
	forRoute i, "Before"
	forRoute i, "Sun"
	forRoute i, "Moon"
	puts "}}"
end

def attr (attribute)
	case attribute.to_i
	when 1 then return "Passion"
	when 2 then return "Cool"
	when 3 then return "Gentle"
	when 4 then return "Cute"
	when 5 then return "Sexy"
	end
end

def skill_init b
	s,m = getSM b
	for i in [b,s,m]
		puts "%s,%s,lskill,%s,skill" % [
			Card[i]['name'],
			SkillDetail[LSkillId[i]]['skillDetail'],
			SkillDetail[SkillId[i]]['skillDetail']
			]
	end
end

def skill_map
	map = JSON.parse File.read(Path + "/master/MCardHaveSkill")
	skill = {}
	lskill = {}
	for i in map
		type = i[1]['seqNo'].to_i
		skill_id = i[1]['skillId']
		card_id = i[1]['cardId']
		if type==1
			skill[card_id] = skill_id
		elsif type==2
			lskill[card_id] = skill_id
		end
	end
	return skill, lskill
end

def quoteMapSort id, route
	map = JSON.parse File.read(Path + "/master/MCardVoice")
	s,m = getSM id
	case route
	when "Before"
		affix = ""
		i = id
	when "Sun"
		affix = "_s"
		i = s
	when "Moon"
		affix = "_m"
		i = m
	end
	arr = []
	map.keys.each do |x|
		if map[x]['cardId'] != i then next end
		arr << x.split(",")[1] + affix + "," + map[x]['voiceId'].to_s
	end
	return arr.sort!
end

def quoteMap id
	ctx = []
	voiceId = []
	arr.each do |x|
		ctx << x.split(",")[0]
		voiceId << x.split(",")[1]
	end
	unique = ctx.uniq

	p ctx
	
end


def quote id
	text = JSON.parse File.read(Path + "/master/MVoice")
	quoteMap id
end

ARGV.each do |id|


	SkillId, LSkillId = skill_map
	#skill_init id
	#profile_stats id

	quoteMap id, "Before"

	# puts "== Profile =="
	# puts "{{Profile"
	# # puts "|va = "
	# # puts "|origin = "
	# # puts "|age = " + card[i]['age']
	# # puts "|birth = "
	# # puts "|policy = "
	# # puts "|likes = "
	# # puts "|dislikes = "
	# puts "|original = "
	# puts "|event = Summer-Coloured Resort"
	# puts "|desc = " + card[i]['detail']
	# puts "|bg = " + card[i]['backgroundStory']
	# puts "}}"
	# puts "== Story =="
	# puts "{{Still|text=Sun Still|img=Still_"+ list[i]['no'] +"s.jpg}}"
	# puts "{{Still|text=Moon Still|img=Still_"+ list[i]['no'] +"m.jpg}}"
	# puts "== Quotes =="
	
	# puts "\n\tCHARACTERS\n\n"
	
	# puts "|%s" % list[i]['no']
	# puts "|[[File:%s_t.png|80px]]" % list[i]['no']
	# puts "|[[%s]]<br />%s" % [ list[i]['name'], card[i]['name'] ]
	# puts "|Summer-Coloured Resort<br />%s" % card[i]['shortDetail']
	# puts "|data-sort-value=\"%s\"|{{Rarity|%s}}" % [ card[i]['rare'], card[i]['rare'] ]
	# puts "|%s" % attr(card[i]['attr'])
	# puts "|-"
	
	# puts "\n\tSKILLS\n\n"

	# puts "|%s" % list[i]['no']
	# puts "|[[File:%s_t.png|80px]]" % list[i]['no']
	# puts "|[[%s]]<br />%s" % [ list[i]['name'], card[i]['name'] ]
	# puts "|%s" % attr(card[i]['attr'])
	# puts "|Normal"
	# if(skill_en["Before"])
	# 	puts "|%s" % skill_en["Before"]["lskill"]
	# 	puts "|%s" % skill_en["Before"]["skill"]
	# else
	# 	puts "|%s" % skilldesc[skill[i+",2"]['skillId']]['skillDetail']
	# puts "|%s" % skilldesc[skill[i+",1"]['skillId']]['skillDetail']
	# end
	# puts "|-"
	# puts "|%s" % list[i]['no']
	# puts "|[[File:%ss_t.png|80px]]" % list[i]['no']
	# puts "|[[%s]]<br />%s" % [ list[i]['name'], card[i]['name'] ]
	# puts "|%s" % attr(card[i]['attr'])
	# puts "|Sun"
	# if(skill_en["Before"])
	# 	puts "|%s" % skill_en["Sun"]["lskill"]
	# 	puts "|%s" % skill_en["Sun"]["skill"]
	# else
	# 	puts "|%s" % skilldesc[skill[s+",2"]['skillId']]['skillDetail']
	# puts "|%s" % skilldesc[skill[s+",1"]['skillId']]['skillDetail']
	# end
	# puts "|-"
	# puts "|%s" % list[i]['no']
	# puts "|[[File:%sm_t.png|80px]]" % list[i]['no']
	# puts "|[[%s]]<br />%s" % [ list[i]['name'], card[i]['name'] ]
	# puts "|%s" % attr(card[i]['attr'])
	# puts "|Moon"
	# if(skill_en["Before"])
	# 	puts "|%s" % skill_en["Moon"]["lskill"]
	# 	puts "|%s" % skill_en["Moon"]["skill"]
	# else
	# 	puts "|%s" % skilldesc[skill[m+",2"]['skillId']]['skillDetail']
	# puts "|%s" % skilldesc[skill[m+",1"]['skillId']]['skillDetail']
	# end
	# puts "|-"
	
	# puts "\n\tOTHER DETAILS\n\n"
	
	# puts "Hidden skill: " + skilldesc[skill[i+",3"]['skillId']]['skillDetail']
	# puts "Skill classification: " + skilldesc[skill[i+",1"]['skillId']]['classificationId'].to_s

	# puts "\n"
	
end