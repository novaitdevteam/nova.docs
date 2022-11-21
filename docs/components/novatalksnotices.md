{%
   include-markdown "./links.md"
   start="<!--datelink-novatalks-start-->"
   end="<!--datelink-novatalks-end-->"
   rewrite-relative-urls=true
%}

#Nova.Talks
##Features

Relevant flowcharts and other docunetation can be found [here](/nova.docs/components/documents/novatalks/novatalkstoc.html#novatalks)

- **Standard workflow elaboration**:
	
	- Client write a message to messager (for ex. Telegram)

	- Message payload goes to Nova.Botflow

	- Extracts Username from payload

	- Throttling (antispam) of messages

	- Any additional logic up to "chatbot-chatwoot-connector-in" node

	- "chatbot-chatwoot-connector-in" node creates contact, conversation, addititonal attributes and attaches contact to API inbox

	- Message payload goes from "chatbot-chatwoot-connector-in" to Chatwoot URL through inbox webhook

	- Chatwoot sends events through BotAgent webhook 
	
	> events can trigger BotAgent logic by themself ex. Redis subflow

	- BotAgent logic (for ex. Quick Replies)

	- Client chooses transfer: to the agent or to the team
	
		- to agent: transfers on the choosen in a node agent
	
		- to team: transfers on the team with subsequent transfer on agent in it via choosen in a node method
		
		> agent must be in inbox colaborators and be a part of the team
	
	- Agent and\or Team is\are attached to ongoing conversation

	- Client's messages are sent to Agent without BotAgent logic
	
	> adding some logic is possible
	
	- Agent's messages are sent to Client without BotAgent logic

	> adding some logic is possible 

	- All messages, ingoing and outgoing are updating Redis conversation autoclose on inactivity timestamp

	> Redis autoclose on inactivity can be configured

	- Conversation is resolved and fields **Assigned Agent\Team** are set to cleared
	
	> Regardless if it is resolved on inactivity autoclose or by agent himself
	
	- Outbound messages from Agent give him assignment priority when Client do reply
	
	> Agent must be in **Online** status
	
	- Outbound messages from Client in span of some time after conversation is resolved directly assign him on the same agent
	
	> Agent must be in **Online** status
	
	> Time range for direct assignment can be configured 