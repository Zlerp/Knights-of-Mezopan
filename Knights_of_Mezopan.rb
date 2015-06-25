require "./The_Game_ascii"

# places a line in the game.
def put_a_line
  puts "-" * 50
end

# Asks the users questions and gives the options allowed.
def questions (question, options)
  puts question, options
  gets.chomp.downcase 
end


# Used for "Press Enter to Continue"
def enter_continue
	puts "Press Enter to continue..."
	gets.chomp
	system("clear")
end


# Used to wrap text
def word_wrap(text, options = {})
        line_width = options.fetch(:line_width, 80)

        text.split("\n").collect! do |line|
          line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\n").strip : line
        end * "\n"
 	end

# Death Method
def deaths
	puts "YOU ARE DEAD!!!!!" 
	puts "You failed squire duties of escorting Sir Rodrick!" 
	puts "You have brought shame to your family name!"
	Ascii.death
	thr = Thread.new {puts `afplay ./death.mp3 `}
	puts "GAME OVER"
	sleep 5
	exit
end


# Introduction

#Ascii Art and songs..
thr = Thread.new {puts `afplay ./rs-music.mp3 -t 90 -v +2`}
Ascii.intro
thr = Thread.new {puts `afplay ./s-sheath.mp3 `}
 puts "                       			  Developed by: Zach Perlman"
Ascii.devel
enter_continue
put_a_line


#Inro
puts word_wrap("You are a squire who must escort Sir Rodrick Fallon, brother to the great Jimmy, 
to the Pongenous Kingdom! Here, your Knight is to meet his bride to be, the princess, 
as he is the most leet baddassiest Knight of all the 12 Kingdoms of the Realm of Mezopan.", line_width: 80)
enter_continue
put_a_line
puts word_wrap("Only a knight so noble deserves the most beautiful princess of Mezopan.", line_width: 80)
enter_continue


put_a_line
#Question 1
options = ["grab it", "leave it"]
begin
  fork = questions("As you and the knight are riding your steeds, you come across a fork in the road.", "Do you grab it or leave it?")
  
end until options.include? fork     
system("clear")

# fork options.
case fork
when "grab it"
  puts "Item added to satchel!"
  Ascii.fork
else "leave it"
  puts "Real squires eat with their hands anyways... The Garden Trolls thank you."
end
enter_continue

#More Story
puts word_wrap("After traveling for many moon cycles, you find yourself setting up tents for you and your knight just a days worth of travel away from Pongenous", line_width: 80)
puts word_wrap("Sir Rodrick, heavily intoxicated from the mead hes been secretly sipping all day, falls fast asleep right when he hits the fur.", line_width: 80)

#Option 2, Begins Epic story.
options = ["help", "sleep"]
begin
  shrieker = questions("You finally finish putting up your tent, and you hear a shriek in the distance.", "help or sleep")
end until options.include? shrieker   
system("clear")

# shrieker options.
case shrieker
when "help"
  puts word_wrap("You frantically get up, you try to wake Sir Rodrick, but he is sleeping in a puddle of his own urine. You quickly grab your satchel, and sprint in the direction of the shriek!", line_width:80)
else "sleep"
  puts "Screw it, my jobs to escort Sir Rodrick, not save the damsel in distress..."
end
enter_continue

# Sleep Death 1
if shrieker == "sleep"
  puts "You slowly fall asleep, feeling great that you are almost at Pongenous"
  enter_continue
  puts "Suddenly you wake up! all you can see is a pair of eyes glowing back at you. You hear a whisper'Sleep tight', and feel a slice on your kneck..."
  enter_continue
  deaths
end

# Story 3
put_a_line
puts word_wrap("Running through the woods, branches breaking on your body as you pass with such force, you finally find the source of this scream", line_width: 80)
enter_continue
put_a_line
puts word_wrap("A witch has taken advantadge of youre heroism and lured you under false pretnenses!", line_width: 80)
enter_continue
put_a_line
puts word_wrap("The witch calls you over, and as if you're under her spell, you're feet beging to step towards her without any contorl!", line_width: 80)
enter_continue
put_a_line
puts word_wrap("A witch has taken advantadge of youre heroism and lured you under false pretnenses!", line_width: 80)
enter_continue
put_a_line
puts word_wrap("She knows who you are, Sir Rodrick's squire, and is aware of your duties to escort him to his new bride.", line_width: 80)
enter_continue
put_a_line
puts word_wrap("She tells you the real tale of Sir Rodrick and how he slayed many inocent people, on his drunk rampages durring the great battles.", line_width: 80)
enter_continue

if fork == "grab it"
	#Option 3, Witches Request with fork.
	options = ["give", "run"]
	begin
  		poison = questions("Witch: 'I know you have the fork in your Satchel. Give it to me, let me poison it, and let that beast eat from it!'", "give or run")
	end until options.include? poison   
	system("clear")
else
	#Option 3, Witches Request without fork.
	options = ["take", "run"]
	begin
  		poison = questions("She gives you a Challice of poison mead 'Give this poisoned mead to Sir Rodrick, let him drink it and pay for his crimes.'", "take or run")
	end until options.include? poison   
	system("clear")
end

# cases for Poisoned mead, posined fork, or run.
case poison
when "run"
	if fork == "grab it"
		puts word_wrap("You shove the witch, and start to run back towards camp. You hear her laugh as you trip and fall, landing directly on your satchel, the fork piercing your heart.", line_width: 80)
		enter_continue
		deaths
	else
		puts word_wrap("You shove the witch, and start to run back towards camp. You find Sir Rodrick, his eyes enraged  with drunken hate. He grabs you by the kneck, you try to scream, nothing helps.", line_width:80)
		enter_continue
		deaths
	end
when "take"
 	Ascii.challice
	puts word_wrap("You take the mead, finally a chance to prove your family name worthy! You head back towards the camp.", line_width: 80)
when "give"
	puts word_wrap("you give her the fork, she poisons it and you head back towards camp, angry that you believed the lies you were told be Sir Rodrick.", line_width: 80)
end
enter_continue


#  For the win
if fork == "grab it"
	put_a_line
	puts word_wrap("With the sun rising, you finally make i back to camp. Sir Rodrick, slowly waking up screams at you to cook some food, for his hangover. You find some eggs, cook them, and give Sir Rodrik the food along with the poisoned fork from the Witch...
	Within seconds of the first bite, Sir Rodrick starts convulsing, the poison is kicking in! Finally, someone has slayed this awful person!", line_width: 80)
	enter_continue
	put_a_line
	puts word_wrap("You finish your journey to Pongenous and find out Sir Rodrick was not going there to merry the Princess, but to kill the King!", line_width: 80)
	enter_continue
	put_a_line
	puts word_wrap("The King Welcomes you into his castle, he thanks you and says 'Only someone so noble as yourself could have killed that monster! Please join me as one of my Knights, at my round Table!'.", line_width: 80)
	enter_continue
	put_a_line
	puts word_wrap("YOU HAVE BEEN KNIGHTED! YOU HAVE BROUGHT FAME TO YOUR FAMILY NAME! YOU WIN!!!.", line_width: 80)
	enter_continue
	thr = Thread.new {puts `afplay ./win.mp3 -v +5`}
	Ascii.win
	exit
else
	put_a_line
	puts word_wrap("You quickly rush back to camp holding the mead carefull not to spill a single drop, as you know a single touch of the poison will do the trick. You find Sir Rodrick awake, but still falling over himself. You say 'Sir Rodrick, I have found some more delicious Mead for you!, i know it's your favorite!' Sir Rodrick says back 'Why thanksk youz sirs, Id's loves some Meads mores.'", line_width: 80)
	enter_continue
	put_a_line
	puts word_wrap("He goes to grab the Challice of mead from your hands, but he is soo drunk that he accidentally knocks the Challice out of your hands, directly into your face! You feel the poison hit your bloodstream, and before you can say 'Garden Troll' you are DEAD!!", line_width: 80)
	enter_continue
	deaths
	end


