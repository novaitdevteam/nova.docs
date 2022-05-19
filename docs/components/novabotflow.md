{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#Nova.BotFlow
##Product Notices
***
##2022R2
###2022R2-2 :briefcase: Epic
####New Features
- *Genesys*: Genesys Open Messagin API connection node [:clipboard: NOV-345] [NOV-345]

	> Genesys In and Genesys Out nodes (receiver and sender namely)

	- **Functionality**:
	
		• sending of text content both ways

		• sending of media content both ways

		• sending of standard json template with {firstname}, {lastname}, {source}, {userid}, etc.

	- **Additional functionality**:
	
		• events logging (same as Open API in BotConnector)

- Code Review [:clipboard: NOV-370] [NOV-370]

	> Recheck of all possible places where unhandled exceptions can arise

- *Nova.Chats*: Nova.Chats (chat24.io) connection node [:clipboard: NOV-369] [NOV-369]

	> Genesys In and Genesys Out nodes (receiver and sender namely)

	- **Functionality**:
	
		• sending of text content both ways

		• sending of media content both ways

		> POST /v1/messages/inbox

		• sending of standard json template with {firstname}, {lastname}, {source}, {userid}, etc.

	- *Known issue*:
	
		After sending of media file (image or pdf) in Nova.Chats few times in a row, all messages will duplicate the first media message.
	
		> Nova.Chats sends HEAD + GET requests on first message, then downloads media. After that, it does send only HEAD request and media downloaded previously. This behaviour works for 2-5 minutes.
	
####Bug Fixes
- *NovaTalks*: Welcome message duplication in standard flow on media first message [:clipboard: NOV-372] [NOV-372]

	> switched off **message_updated** events handling

***

###2022R2-1 :briefcase: Epic
####New Features
- *All channels*: Message throttle (message antispam) node [:clipboard: NOV-368] [NOV-368]

	- Node's work mechanism: pass through **X** messages in span of **Y** time; other messages are considered as **blocked**
	
	> **X** and **Y** parameters can be configured. 
	
	> Time values supported in: miliseconds, seconds, minutes, hours.
	
	- **blocked** messages can be redirected to second pin

	- has field **Queue template** by which the queue will be determined (usually: **{{payload.chatId}}**)

	> • node has visual counter with number of active queues

	> • node has visual counter with number of blocked queues

####Bug Fixes
- none
***

##2022R1
###2022R1-4 :briefcase: Epic
####New Features
- Compatibility with Node-RED v2.2.0 and v2.2.1 [:clipboard: NOV-345] [NOV-345]
- *ABC*: Message queue [:clipboard: NOV-352] [NOV-352]

	> feature helps sending messages in currect order

- Redis expiration parameter for keys [:clipboard: NOV-353] [NOV-353] 

	> Value is listed in seconds

	> Value equal to zero means that key doesn't have expiration date

####Bug Fixes
- Fixed renaming sent files to "file_xxx" format [:clipboard: NOV-321] [NOV-321]

	> Files retain their original names
	
	> Spaces in names are changed to "%20"

- *Viber*: Fixed video file size assertion error [:clipboard: NOV-351] [NOV-351]
***

###2022R1-3 :briefcase: Epic
####New Features
- **log4node** plus **LogStash** logging [:clipboard: NOV-340] [NOV-340]

	- Nova.BotFlow can send events: CONVERSATION_MESSAGE_IN and CONVERSATION_MESSAGE_OUT

	> In Nova.BotFlow nodes the "Track" must be activated
	
	> All data is sent to Elastic Kibana for visualization

	- **Data filtering examples**: 

		• number of messages in channel (total or per time period)

		• number of unique conversation id's

		• inbound or outbound messages only

<details><summary>Envirounment variables in BotFlow service</summary>
<p>
```
Environment="NODE_ENV=production"
Environment="NODE_RED_OPTIONS=-s /opt/nova-botflow/config/settings.js"
Environment="LOGSTASH_HOST=http://192.168.125.40:5044"
Environment="LOGSTASH_CHANNEL=nova-botflow-demo"
#Environment="LOGSTASH_USERNAME=logstash"
#Environment="LOGSTASH_PASSWORD=password"

# LOGSTASH_HOST - address of Elastic Kibana
# LOGSTASH_CHANNEL - index pattern in Elastic Kibana
```
</p>
</details>
<details><summary>Logstash block in BotConnector configuration</summary>
<p>
```
logstash: {
    type: '@log4js-node/logstash-http',
    url: 'http://192.168.125.40:5044',
    application: 'nova-botconnector-demo',
    logType: 'application',
    logChannel: 'nova-botconnector-demo'
}

 • "type" - category filter
 • "url" - address of Elastic Kibana
 • "logChannel" - index pattern in Elastic Kibana
 
categories: {
    default: {appenders: ['file'], level: 'trace'},
    traking: { appenders: [ 'logstash' ], level: 'info' }
}	

 • "appenders" - the name of appender to filter
 • "level" - debug level
```
</p>
</details>
<details><summary>Elastic Kibana logging example</summary>
<p>
```
@timestamp:Feb 17, 2022 @ 13:28:06.517 
@version:1 
channel:nova-botflow-demo 
context.channel:telegram 
context.channelId:26df8ba1.8764d4 
context.channelName:Chat_automation_test_bot2 
context.conversationId:Chat_automation_test_bot2-26df8ba1.8764d4-385661593 
context.event:CONVERSATION_MESSAGE_IN 
context.flowId:56711e55.d186c 
datetime:Feb 17, 2022 @ 13:29:33.706 
host:dev-01_ncc-demo.demo 
level_name:info 
message:Conversation message in 
_id:QXFwB38Bh1gKl6P4e3l4 
_index:nova-botflow-demo 
_score: - 
_type:_doc
```
</p>
</details>

####Bug Fixes
- none
***

###2022R1-2 :briefcase: Epic
####New Features
- *NovaTalks*: Combobox selection of Agents and Teams[:clipboard: NOV-330] [NOV-330]

	- On opening chatbot-chatwoot-botagent-transfer node renders Agent or Team (can be selected) list

	- Receive information by requesting ChatWoot API:

	> 	Agents list: GET {host}/api/v1/accounts/{account_id}/agents (Headers has only api_access_token)

	> 	Teams list: GET {host}api/v1/accounts/{account_id}/teams (Headers has only api_access_token)

<details><summary>Error cases</summary>
<p>
```
• WEB is down:

On list request we'll receive in browser devtools' console:
red.min.js?v=2.1.3:16 WebSocket connection to 'wss://novachatsconnector.test.novait.com.ua/botflow/comms' failed: 

• Redis is down:

On list request we'll receive in devtools' console:
GET https://novachatsconnector.test.novait.com.ua/redbot/chatwoot-botagent/get_agents?id=367e10bd2df215cc 502 (Bad Gateway)
and WebSocket errors

• Request has status code not equal to 200:

Error with status code 502 in BotFlow debug window

• Wrong BotFlow configuration:

Error shown as a red triangle icon under chatbot-chatwoot-botagent-receive node
```
</p>
</details>
- *NovaTalks*: Created BotAgent chatbot flow [:clipboard: NOV-320] [NOV-320]

	- BotAgent-In can parse events: conversation_opened, conversation_resolved

	- BotAgent-Out ignore his own messages sent on webhook

- *NovaTalks*: Conversation state check node [:clipboard: NOV-320] [NOV-320]

	- chatbot-chatwoot-conversation-state node can check conditions:

		• "**isAnswered**" state in X minutes ("Answer timeout" can be configured)
		
		• "**isTransferred**" state

- *NovaTalks*: Chatwoot BotAgent Outgoing events [:clipboard: NOV-322] [NOV-322]

	- chatbot-chatwoot-botagent-receive node not only process incoming, but also outgoing messages (sent from BotAgent)

####Bug Fixes
- *ABC*: fixed files being not sent to client [:clipboard: NOV-335] [NOV-335]

	- Files that are not message, photo, or video are converted into **.document** extension
***

###2022R1-1 :briefcase: Epic
####New Features
- *WhatsApp (Nexmo)*: migration from API v0.1 to API v1 [:clipboard: NOV-309] [NOV-309]
- *WhatsApp (Nexmo)*: backwards compatibility with API v0.1 [:clipboard: NOV-309] [NOV-309]

####Bug Fixes
- none
***

##2021R4
####New Features
- *All channels*: Developed **Message Queue** node with ability to store messages and retrive then on request [:clipboard: NOV-290] [NOV-290]

	- created own package based on **node-red-contrib-multiple-queue**

- *NovaTalks*: Implemented integration with ChatWoot Agent Bot [:clipboard: NOV-299] [NOV-299]

	- ChatWoot BotAgent node (chatbot-chatwoot-botagent-send/receive) does support:

		• text messages

		• media (pictures, video, audio, files)
	
		• rich media (inline-buttons, quick-replies, generic-template)
	
	- ChatWoot BotAgent Transfer node (chatbot-chatwoot-botagent-transfer):
	
		• can trasfer on team or agent with specified ID
	
		• fields "Transfer target type" and "Transfer target" must be filled
	
	- Event Switch node (chatbot-chatwoot-conversation-switch) to work with conversation states:
	
		• Pending
	
		• Open
	
		• Snoozed
	
		• Resolved

		• Other

- *All channels*: RedBot 0.19.11 new functionality transfer to Nova.Botflow [:clipboard: NOV-282] [NOV-282]
- *ABC*: added **Quick Reply** message support [:clipboard: NOV-204] [NOV-204]

	> Available from iOS 15, iPadOS 15, macOS 12 beta 5

- *ABC*: added **Checking List** and **Time Picker** messages support [:clipboard: NOV-205] [NOV-205]
- *ABC*: added **Capability List** header support [:clipboard: NOV-206] [NOV-206]

	> With backwards compatibility for versions of iOS < 15.0

- Developed **Message Queue** node with ability to store messages and retrive them on request [:clipboard: NOV-288] [NOV-288]

	> **node-red-contrib-simple-message-queue** functionality check
	
- *Twitter*: added support of channel [:clipboard: NOV-224] [NOV-224]
- *WhatsApp (Infobib)*: added support of channel [:clipboard: NOV-232] [NOV-232]
- *Vkontakte*, **, **:Added support of Rich Media messages to channels [:clipboard: NOV-283] [NOV-283]

	- **Channels**:
	
		• Vkontakte 

		• Odnoklassniki

		• WhatsApp (Infobib)

- Realised ChatWoot connector [:clipboard: NOV-298] [NOV-298]
- Transfered **node-red-contrib-channels** and **node-red-contrib-chatbot-apple** packages to **node-red-contrib-chatbot** [:clipboard: NOV-299] [NOV-299]

####Bug Fixes
- Fixed Refresh Timeout function [:clipboard: NOV-280] [NOV-280]
***

##2021R3
####New Features
- *All channels*: added outbound messages [:clipboard: NOV-239] [NOV-239]:
	
	• without specific answer redirect on agent or workgroup\skillgroup 
	
	• with reservation of agent or workgroup\skillgroup after outbound message and specific answer redirect on agent or workgroup\skillgroup
	
	• with reservation of agent or workgroup\skillgroup after client's reply and specific answer redirect on agent or workgroup\skillgroup

- Extended support of Rich Media for Omilia [:clipboard: NOV-176] [NOV-176]
- Added ChatProxy support for existing channels [:clipboard: NOV-177] [NOV-177]
- Enhanced webhook implementation for channels [:clipboard: NOV-183] [NOV-183]

	• Webhooks are following one set URL template (excluding Apple channel)

	• Few bots can be setup on one channel at the same time (in different flows or with switch)

- *WhatsApp (Infobip)*: added support of channel [:clipboard: NOV-184] [NOV-184]
- *All channels*: added **sessionRefreshTimeout** to **Omilia** conversations [:clipboard: NOV-188] [NOV-188]

	• Mechanism: at the start of conversation sets timer that every time checks if there were messages from client in set timeframe, if messages weren't sent, then it throws up **No Input** event to Omilia

- *All channels*: added functionality to call second Omilia app [:clipboard: NOV-189] [NOV-189]

	> For example: survey application

- *ABC*: smiles are converted in unicode and sent to Omilia [:clipboard: NOV-190] [NOV-190]

	> Omilia doesn't support any media content

- Developed backward compatibility of inbuild nodes [:clipboard: NOV-191] [NOV-191]
- *Slack*: added support of channel [:clipboard: NOV-201] [NOV-201]
- Migration to Node.Red version 2.X [:clipboard: NOV-207] [NOV-207]
- Added logging to external .log file on server [:clipboard: NOV-208] [NOV-208]
- Added **Redis** as a context provider [:clipboard: NOV-210] [NOV-210]

	> Based on ioredis library

- *Telegram*: added **Card** Rich Media messages support [:clipboard: NOV-219] [NOV-219]
- *Telegram*: added **Carousel**Rich Media messages support [:clipboard: NOV-220] [NOV-220]
- *Slack*: added **Button Grid** Rich Media messages support [:clipboard: NOV-233] [NOV-233]
- *Slack*: added **Button List** Rich Media messages support [:clipboard: NOV-234] [NOV-234]
- *Vkotankte*: added support of channel [:clipboard: NOV-230] [NOV-230]
- *Odnoklassniki*: added support of channel [:clipboard: NOV-231] [NOV-231]
- Realised parallel work of same channels (with different configuration) on separate flows [:clipboard: NOV-263] [NOV-263]
- Imported **chat-platform** library for further support and development from our side [:clipboard: NOV-209] [NOV-209]

####Bug Fixes
- *Viber*: fixed sending of attachments both ways [:clipboard: NOV-180] [NOV-180]
- *Telegram*: fixed sending comments with media content [:clipboard: NOV-217] [NOV-217]
- Negated influence of receiver nodes in swiched off flows on working received nodes [:clipboard: NOV-235] [NOV-235]
- *Slack*: fixed **oAuthURL** link generation on channel creation [:clipboard: NOV-236] [NOV-236]
***

##2021R2
####New Features
- Added node-connector to **Genesys.PureCloud** [:clipboard: NOV-143] [NOV-143]
- Added node-connector to **Cisco.ECE** [:clipboard: NOV-144] [NOV-144]
- Added node-connector to **Omilia** [:clipboard: NOV-145] [NOV-145]
- Added node-connector to **Genesys.PureEngage** [:clipboard: NOV-146] [NOV-146]
- *WhatsApp (Nexmo)*: added support of channel [:clipboard: NOV-158] [NOV-158]
- *WeChat*: added support of channel [:clipboard: NOV-159] [NOV-159]
- Realized native attachment sending (no URL) for PureEngage [:clipboard: NOV-160] [NOV-160]
- *ABC*: Added support of **Omilia** buttons for **Apple Chat** [:clipboard: NOV-178] [NOV-178]
- Made bufferization of media content for optimization of flow building [:clipboard: NOV-179] [NOV-179]

####Bug Fixes
- none
***

##2021R1
####New Features
- *ABC*: added sending of **Rich Link** messages [:clipboard: NOV-129] [NOV-129]
- *ABC*: added sending of **Interactive** messages [:clipboard: NOV-130] [NOV-130]: 
	
	• **List Picker** in **Apple List Template** node
	
	• **Time Picker** in **Apple List Template** node

- *ABC*: developed the following nodes [:clipboard: NOV-131] [NOV-131]:
	
	• *Authentication*: node **Apple Auth** for autorization
	
	• *Apple Pay*: node **Apple Pay** to pay for services/goods
	
	• **Custom Interactive Messages**: node adds ability to send data structures that can be rendered by custom ABC application

####Bug Fixes
- none
***

##2020R4
####New Features
- *ABC*: added support of Apple Business Chat [:clipboard: NOV-102] [NOV-102]:
	
	• sending and receiving text messages	

	• receiving files

	• sending picture files

	• receiving **Typing Indicators** and identificators of chat's session ending (actions)

####Bug Fixes
- none