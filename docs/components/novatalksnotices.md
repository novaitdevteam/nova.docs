{%
   include-markdown ".\links.md"
   start="<!--datelink-novatalks-start-->"
   end="<!--datelink-novatalks-end-->"
   rewrite-relative-urls=true
%}

#Nova.Talks
##Features

-  [:material-location-enter:] [2022r1]

-----------

<details><summary>API inbox workflow</summary>
<p>
```
• Client write a message to messager (for ex. Telegram)
• Message payload goes to Nova.Botflow
• Extracts Username from payload
• Works Nova.BotFlow logic up to "chatbot-chatwoot-connector-in" node
• "chatbot-chatwoot-connector-in" node creates contact, conversation, addititonal attributes and attaches contact to API inbox
• Message payload goes from "chatbot-chatwoot-connector-in" to Chatwoot URL through inbox webhook
• Chatwoot sends through agent webhook events
• Works Nova.BotFlow BotAgent logic (for ex. Quick Replies)
• Client chooses transfer: to agent, to team
	- to agent: transfers to agent with ID written in Nova.BotFlow logic
	- to team: transfers to agent in team (must be in inbox colaborators)
	- Agents priority are listed in data base
• Agent is attached to ongoing conversation
• All messages in conversation are sent to Agent
```
</p>
</details>