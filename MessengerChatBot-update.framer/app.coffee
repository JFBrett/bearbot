
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
			text:"Hello"+" #{user}."

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
			text:"Grrrrreat! Are you looking for car, travel or health insurance?"
			choices:[["Health","health"],["Car","sleepy"],["Travel","travel"]]
			
	if choiceVar=="travel"
		msg=new chatBot.Message
			type:"botMsg"
			text:"I notice you travel around Asia a lot  "+" #{user}"+ " ... <br><br>Would you like to see some options for annual travel coverage plans?"
			choices:[["Sure, show me annual plans","annual"],["Other options","yawn"]]
			
	if choiceVar=="annual"
		msg=new chatBot.Message
				type:"botMsg"
				text:"Fabtabulous! Here are some plans that suit you nicely! <br><br>Tap 'Compare' to compare the selected plan with others.<br><br> Or tap 'Go to provider' to check out the plan."
		msg=new chatBot.Message
			type:"cards"
			cards:[{cover:"image",image:"",title:"Etiqa Basic Annual Coverage",text:"$133 a year - coverage score:5.6/10.",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]},{cover:"image",image:"",title:"FWD Premium Annual Plan",text:"$134 per annum - coverage score: 6.8/10.",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]},{cover:"image",image:"",title:"Tokio Marine Classic Plan",text:"$136 per annum - coverage score: 5.6/10.",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]}]
			
	if choiceVar=="health"
		msg=new chatBot.Message
			type:"botMsg"
			text:"And, who would you like the health plan to cover?"
			choices:[["Just me","yawn"],["Me and my spouse","yawn"],["Me, my spouse and kids","yawn"],["Me and my kids","yawn"],["Others","yawn"]]
			
	if choiceVar=="yawn"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Oh dear, "+" #{user}"+ "! <br><br>My trainer didn't but those APIs in my honey muesli this morning.<br><br> I'm sleepy, I need a nice rhubarb pie and a nap."
		msg=new chatBot.Message
			type:"botMsg"
			text:"Maybe you would like to look at some nice shiny credit cards instead?"
			choices:[["Cards for Air miles","airMiles"],["Cards for Cashback","cashBack"]]
			
	if choiceVar=="credit"
		msg=new chatBot.Message
			type:"botMsg"
			text:"No problemo! Would you prefer a card that provides cashback or air mile rewards?"
			choices:[["Air miles","airMiles"],["Cashback","cashBack"]]
			
	if choiceVar=="loan"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Awesomeness! Do you want a home or personal loan,"+" #{user}"+ "?"
			choices:[["Personal","personal"],["Home","home"]]			
	
	if choiceVar=="personal"
		msg=new chatBot.Message
			type:"botMsg"
			text:"What do you need the loan for?"
			choices:[["Personal purposes","sleepy"],["Education","sleepy"],["Rennovation","sleepy"]]
			
	if choiceVar=="home"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Burrrrp!!! I think I ate far too many pies last night "+" #{user}"+ ", I need to lie down."
		msg=new chatBot.Message
			type:"botMsg"
			text:"Maybe you would like to look at some personal loan options instead?"
			choices:[["Loans for personal purposes","sleepy"],["Education loans","sleepy"],["Rennovation loans","sleepy"]]
			
	if choiceVar=="sleepy"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Ooops! My trainer never taught me about that stuff "+" #{user}"+ ". I'm confused, I need some more pies and a nice siesta."
		msg=new chatBot.Message
			type:"botMsg"
			text:"Maybe you would like to look at some nice shiny credit cards instead?"
			choices:[["Cards for Air miles","airMiles"],["Cards for Cashback","cashBack"]]
						
	if choiceVar=="cashBack"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Cool! On average what do you spend per month on your credit card?"
			choices:[["Less than $500","cashBackAmt"],["About $1000","cashBackAmt"],["Around $1500","cashBackAmt"],["At least $2000","cashBackAmt"],["$3000 - $3500","cashBackAmt"],["Around $4000","cashBackAmt"],["Above $5000","cashBackAmt"]]
			
	if choiceVar=="cashBackAmt"
		msg=new chatBot.Message
			type:"botMsg"
			text:"OK. Just a couple more questions. What do you use your card for most?"
			choices:[["Shopping","mostCashBack"],["Groceries","mostCashBack"],["Eating out","mostCashBack"],["Online shopping","mostCashBack"]]
			
	if choiceVar=="mostCashBack"
		msg=new chatBot.Message
				type:"botMsg"
				text:"Cool! Here are some cards that suit you nicely! <br><br>Tap 'Compare' to compare the selected card with others.<br><br> Or tap 'Go to bank' to check out the card."
		msg=new chatBot.Message
			type:"cards"
			cards:[{cover:"image",image:"images/cashback/ocbc-mc-rewards.png",title:"OCBC Titanium Rewards",text:"Earn up to $459 cashback per annum and get $50 free on signup.",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]},{cover:"image",image:"images/cashback/citi-mc-rewards.png",title:"Citi Rewards Mastercard",text:"Up to $739 per annum cashback with $250 rebate for new customers!",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]},{cover:"image",image:"images/cashback/cimb-visa-sig.png",title:"CIMB Visa Signature",text:"Earn cashback up to $720 per annum and $150 credit if new to bank.",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]}]
			
	if choiceVar=="airMiles"
		msg=new chatBot.Message
			type:"botMsg"
			text:"Cool! On average what do you spend per month on your credit card?"
			choices:[["Less than $500","airMilesAmt"],["About $1000","airMilesAmt"],["Around $1500","airMilesAmt"],["At least $2000","airMilesAmt"],["$3000 - $3500","airMilesAmt"],["Around $4000","airMilesAmt"],["Above $5000","airMilesAmt"]]
			
	if choiceVar=="airMilesAmt"
		msg=new chatBot.Message
			type:"botMsg"
			text:"OK. Just a couple more questions. What do you use your card for most?"
			choices:[["Shopping","mostAirMiles"],["Groceries","mostAirMiles"],["Eating out","mostAirMiles"],["Online shopping","mostAirMiles"]]

	if choiceVar=="mostAirMiles"
		msg=new chatBot.Message
				type:"botMsg"
				text:"Cool! Here are some cards that suit you nicely! <br><br>Tap 'Compare' to compare the selected card with others.<br><br> Or tap 'Go to bank' to check out the card."
		msg=new chatBot.Message
			type:"cards"
			cards:[{cover:"image",image:"images/airmiles/anz-visa-sig-travel.png",title:"ANZ Visa Travel Card",text:"Earn up to 100,800 miles per annum. Exclusive offer - free suitcase and up to 25,000 miles.",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]},{cover:"image",image:"images/airmiles/ocbc-visa-voyage.png",title:"OCBC Visa Voyage",text:"Earn up to 103,200 miles per annum, with 15,000 free miles when you sign up!",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]},{cover:"image",image:"images/airmiles/uob-amex-miles.png",title:"UOB PRVI Miles AmEx Card",text:"Earn up to 120,800 miles per annum. 10,000 miles free if new to bank.",choices:[["<a href='#' style='color:blue'>Compare on GoBear.com</a>",""],["<a href='#' style='color:blue'>Go to bank</a>",""]]}]


		

	
	
			
