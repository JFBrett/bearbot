
#framer info
Framer.Info =
	title: "Facebook messenger chatbot"
	description: "prototyping framer messenger bots"
	author: "Sergey Voronov"
	twitter: "mamezito"

#modules
chatBot = require "chatBot"

#initial settings
botName="bearbot"
botImage="images/logo.png"
likes="282k people like this"
botCategory="Search"
user="Ivonne"

chatBot.createMessenger(botName,botImage,likes,botCategory,user)


#bot logic
#function checking for user input

window["userInput"]=(input)->
	if input.indexOf("Hi") != -1 || input.indexOf("Hello") != -1 ||input.indexOf("Hey") != -1 ||input.indexOf("Yo") != -1 ||input.indexOf("Hi Bear") != -1 ||input.indexOf("hi") != -1 ||input.indexOf("hello") != -1 ||input.indexOf("HI") != -1 ||input.indexOf("Hi!") != -1 
		msg=new chatBot.Message
			type:"botMsg"
			text:"Hello again "+" #{user}."

		msg=new chatBot.Message
			type:"botMsg"
			text:"The bear is all yours! How can I help you today?"
			choices:[["Search for loans","loan"],["Search for credit cards","credit"],["Search for insurance","insurance"]]
	else 
		msg=new chatBot.Message
			type:"botMsg"
			text:"Hrmph, I'm still a bit sleepy from all those burritos last night"+" #{user}! "+ "<br>I'm not sure I understand you :). <br><br>Can I help you search for any of these?"
			choices:[["Insurance","insurance"],["Credit card","credit"],["Loan","loan"]]
			
			
			
#function checking product option selected
window["choiceFunc"]=(choiceVar)->
	if choiceVar=="insurance"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Grrrrreat, I can help you with that:)"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Are you looking for car, travel or health insurance?"
			choices:[["Travel","travel"],["Car","car"],["Health","health"]]

	if choiceVar=="travel"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Yay, travel! Are you looking for a single or an annual plan?"
			choices:[["Single",""],["Annual","travelPlan"]]

	if choiceVar=="travelPlan"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Will you be travelling alone"+" #{user}"+ ", or with others?"
			choices:[["Just me","destination"],["2 people","destination"],["3 people","destination"],["4 people","destination"],["5 people","destination"]]
			
	if choiceVar=="destination"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Cool! Do you need worldwide coverage, or maybe something else?"
			choices:[["Asia","coverage"],["ASEAN","coverage"],["Worldwide","coverage"],["Worldwide, excluding USA","coverage"]]
			
	if choiceVar=="credit"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Would you prefer a card that provides cashback or air mile rewards?"
			choices:[["Air miles","airMiles"],["Cashback","cashBack"]]
			
	if choiceVar=="loan"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Awesomeness! I know all about loans :)"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Do you want a home or personal loan,"+" #{user}"+ "?"
			choices:[["Personal","personal"],["Home","home"]]			
	if choiceVar=="personal"
		msg=new chatBot.Message
			type:"botMsg"
			text:"And, what do you need the loan for?"
			choices:[["Personal purposes","personalPurposes"],["Education","edu"],["Rennovation","reno"]]
	if choiceVar=="home"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Ah ... can I get back to you on that "+" #{user}"+ "? I think I had some bad pie last night ... Maybe you would prefer one of the Personal loan options below? :P"
			choices:[["Personal purposes","personalPurposes"],["Education","edu"],["Rennovation","reno"]]
			
	if choiceVar=="cashBack"
		msg=new chatBot.Message
			type:"botMsg"
			text:"OK. Just a couple more questions. <br><br>On average what do you spend per month on your credit card?"
			choices:[["Less than $500","cashBackAmt"],["About $1000","cashBackAmt"],["Around $1500","cashBackAmt"],["At least $2000","cashBackAmt"],["$3000 - $3500","cashBackAmt"],["Around $4000","cashBackAmt"],["Above $5000","cashBackAmt"]]
			
	if choiceVar=="airMiles"
		msg=new chatBot.Message
			type:"botMsg"
			text:"OK. Just a couple more questions. <br><br>On average what do you spend per month on your credit card?"
			choices:[["Less than $500","airMilesAmt"],["About $1000","airMilesAmt"],["Around $1500","airMilesAmt"],["At least $2000","airMilesAmt"],["$3000 - $3500","airMilesAmt"],["Around $4000","airMilesAmt"],["Above $5000","airMilesAmt"]]
			
	if choiceVar=="airMilesAmt"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Cool! And what do you use your card for most?"
			choices:[["Shopping","mostAirMiles"],["Groceries","mostAirMiles"],["Eating out","mostAirMiles"],["Online shopping","mostAirMiles"]]
			
	if choiceVar=="cashBackAmt"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Cool! And what do you use your card for most?"
			choices:[["Shopping","mostCashBack"],["Groceries","mostCashBack"],["Eating out","mostCashBack"],["Online shopping","mostCashBack"]]

	if choiceVar=="mostAirMiles"
		msg=new chatBot.Message
				type:"botMsg"
				text:"Cool! Here are some cards that suit you nicely!<br><br> Tap 'Compare' to compare the selected card with others.<br><br> Or tap 'Go to bank' to check out the card."
		msg=new chatBot.Message
			type:"cards"
			cards:[{cover:"image",image:"images/airmiles/anz-visa-sig-travel.png",title:"ANZ Visa Travel Card",text:"Earn up to 100,800 miles per annum. Exclusive offer - free suitcase and up to 25,000 miles.",choices:[["Compare","compare"],["Go to bank","goBank"]]},{cover:"image",image:"images/airmiles/ocbc-visa-voyage.png",title:"OCBC Visa Voyage",text:"Earn up to 103,200 miles per annum, with 15,000 free miles when you sign up!",choices:[["Compare","compare"],["Go to bank","goBank"]]},{cover:"image",image:"images/airmiles/uob-amex-miles.png",title:"UOB PRVI Miles AmEx Card",text:"Earn up to 120,800 miles per annum. 10,000 miles free if new to bank.",choices:[["Compare","compare"],["Go to bank","goBank"]]}]
			
	if choiceVar=="mostCashBack"
		msg=new chatBot.Message
				type:"botMsg"
				text:"Cool! Here are some cards that suit you nicely!<br><br> Tap 'Compare' to compare the selected card with others.<br><br> Or tap 'Go to bank' to check out the card."
		msg=new chatBot.Message
			type:"cards"
			cards:[{cover:"image",image:"images/cashback/ocbc-mc-rewards.png",title:"OCBC Titanium Rewards",text:"Earn up to $459 per annum and $50 upon approval.",choices:[["Compare","compare"],["Go to bank","goBank"]]},{cover:"image",image:"images/cashback/citi-mc-rewards.png",title:"Citi Mastercard Rewards",text:"Earn up to $739 per annum and $250 rebate on approval.",choices:[["Compare","compare"],["Go to bank","goBank"]]},{cover:"image",image:"images/cashback/cimb-visa-sig.png",title:"CIMB Visa Signature",text:"Earn cashback up to $720 per annum and up to $150 cash credit.",choices:[["Compare","compare"],["Go to bank","goBank"]]}]
			
	if choiceVar=="coverage"
		msg=new chatBot.Message
				type:"botMsg"
				text:"Cool! Here are some cards that suit you nicely!<br><br> Tap 'Compare' to compare the selected card with others.<br><br> Or tap 'Go to bank' to check out the card."
		msg=new chatBot.Message
			type:"cards"
			cards:[{cover:"image",image:"images/cashback/ocbc-mc-rewards.png",title:"OCBC Titanium Rewards",text:"Earn up to $459 per annum and $50 upon approval.",choices:[["Compare","compare"],["Go to bank","goBank"]]},{cover:"image",image:"images/cashback/citi-mc-rewards.png",title:"Citi Mastercard Rewards",text:"Earn up to $739 per annum and $250 rebate on approval.",choices:[["Compare","compare"],["Go to bank","goBank"]]},{cover:"image",image:"images/cashback/cimb-visa-sig.png",title:"CIMB Visa Signature",text:"Earn cashback up to $720 per annum and up to $150 cash credit.",choices:[["Compare","compare"],["Go to bank","goBank"]]}]

	
	
			
