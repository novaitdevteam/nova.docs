{%
   include-markdown "./links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#Nova.BotFlow
##Product Notices
***

###2022R4-5 :briefcase: Epic
####New Features
- *Nova.Botflow*: Add "Video" processing (FB Messenger) [:clipboard: NC2-177] [NC2-177]

	- Added processing of outgoing videos to the code .\src\node-red-contrib-chatbot\lib\platforms\facebook\facebook.js
	> .\src\node-red-contrib-chatbot\lib\platforms\facebook\facebook.js

- *Nova.Botflow* IVR menu: chatBot changes [:clipboard: NC2-368] [NC2-368]
	- Updated botflow according to new [Menu (IVR) TK](https://drive.google.com/open?id=1wl5w_mNff59Cdrz0BJfL9iI3zrFnDCjw&authuser=cristina.podoliuh%40novait.com.ua&usp=drive_fs).

- *Nova.Botflow* NodeRed 3 migration [:clipboard: NC2-404] [NC2-404]
	- Updated **node-red -> 3.0.2**
	- Updated **node.js -> 18.12.1** (node:18.12.1-alpine)
	- Updated **yarn.lock**
	- Added commitlint [commitlint](https://commitlint.js.org/).


####Bug Fixes

- *Nova.Botflow*: Correct handling of unsupported types in connectors[:clipboard: NC2-364] [NC2-364]
	- Fixed handling of messages with type = undefined if the message passed all checks and did not receive a type, so this type is not supported.
	- Such messages are reset and do not leave the connector.

- *Nova.Botflow*:Queue modernization [:clipboard: NC2-398] [NC2-398]

	- Fixed incorrect behavior when the queue gap is set to 0
	- Now we can insert a Queue Selector into the several nesting levels. For example: payload.chatId.

	
- *Nova.Botflow* Errors with sending pictures, videos and messages [:clipboard: NC2-293] [NC2-293]
	- In TG\Viber\Messenger\Nexmo\Whatsapp Buisness nodes added variable **attachmentUrl** in **payload**.
	- When the file size is greater than **MAX_FILE_SIZE**(env) Chatwoot In (NovaTalks In) sends **attachmentUrl**.
	
- *Nova.Botflow* NodeRed fallDown while sending **msg** without **chat** [:clipboard: NC2-416] [NC2-416]
	- Added processing **msg** objects without **chat()** by **done()** func.

- *Nova.Botflow* The **track** state on the sender node is not saves [:clipboard: NC2-399] [NC2-399]
	- Fixed stopping of sending messages when NodeRed incorrectly shutting down.
	- Updated sender-factory work with global context and enviroment.


##2022R4
###2022R4-1-2-3-4 :briefcase: Epic
####New Features

- *Nova.BotFlow*: Whatsapp-Web: Receiving unread messages [:clipboard: NC2-396] [NC2-396]

	- Whatsapp-Web: when BotFlow starts, the process of reading all unread messages that have accumulated will be started.

- *Nova.BotFlow*: Initiation of new messages without a bot [:clipboard: NC2-330] [NC2-330]

	- If the agent is the initiator of the dialog (the agent is the first to write to the client), when the client responded to the dialog, this dialog does not enter the standard chat bot.

####Bug Fixes

- *Nova.BotFlow*: An error occurs when sending a location (viber) [:clipboard: NC2-349] [NC2-349]

	- When user sending a location, 0.0 is sent instead of empty coordinates.



##2022R3
###2022R3-6 :briefcase: Epic
####New Features
- *WhatsApp Business*: Facebook WhatsApp Business Platform Cloud API [:clipboard: NOV-379] [NOV-379]

<details><summary>Nova.Botflow to WhatsApp</summary>
<p>
```
	- Text
	- Media (one pre message, [supported content types](https://developers.facebook.com/docs/whatsapp/cloud-api/reference/media#supported-media-types):
	- Images
		- image/jpeg, image/png
		- Images must be 8-bit, RGB or RGBA
		- 5MB Size Limit
	- Video
		- video/mp4, video/3gp
		- Only H.264 video codec and AAC audio codec is supported.
		- We support videos with a single audio stream or no audio stream.
		- 16MB Size Limit
	- Document
		- text/plain, application/pdf, application/vnd.ms-powerpoint, application/msword, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
		- 100MB Size Limit
	- Audio
		- audio/aac, audio/mp4, audio/mpeg, audio/amr, audio/ogg (only opus codecs, base audio/ogg is not supported)
		- 16MB Size Limit
	- Location
	- Rich Media:
		- inline buttons AS reply button
		- quick reply AS reply button
		- generic template AS reply button
```
</p>
</details>
<details><summary>WhatsApp to Nova.Botflow</summary>
<p>
```
	- Text
	- Media (one pre message, [supported content types](https://developers.facebook.com/docs/whatsapp/cloud-api/reference/media#supported-media-types):
	- Images
		- image/jpeg, image/png
		- Images must be 8-bit, RGB or RGBA
		- 5MB Size Limit
	- Video
		- video/mp4, video/3gp
		- Only H.264 video codec and AAC audio codec is supported.
		- We support videos with a single audio stream or no audio stream.
		- 16MB Size Limit
		- Document
		- text/plain, application/pdf, application/vnd.ms-powerpoint, application/msword, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
		- 100MB Size Limit
	- Audio
		- audio/aac, audio/mp4, audio/mpeg, audio/amr, audio/ogg (only opus codecs, base audio/ogg is not supported)
		- 16MB Size Limit
	- Sticker (Type: Photo)
		- image/webp
		- Static stickers: 100KB Size Limit
		- Animated stickers: 500KB Size Limit
	- Location
	- Share contact (Type: Contact)
	- Reply to message (reply) (Type: Text)
	- Reply to rich media:
		- list (list message)
		- Buttons (reply button)
	- Mark message as "Seen" (Type: Events)
```
</p>
</details>

- **Installation**:
```
	- Create business account on Meta for Developers
	- Create new app (in "my apps") with "bussiness" type. In settings fill in its name, email and add bussiness account
	- In app's dashboard add WhatsApp in products list
	- In WhatsApp product tab, "getting started" option, add bussiness phone number (step 5) from which the customer will converse
	- Add webhook in "configuration", subscribe to events ("messages" is mandane event) and add verification token
	- On "verify" request the following GET request will be sent on webhook:
```
<details><summary>Request /webhooks</summary>
<p>
``` bash
curl -X GET https://www.your-clever-domain-name.com/webhooks?
  hub.mode=subscribe&
  hub.challenge=NUMBER&
  hub.verify_token=TOKEN
```
</p>
</details>

	- Create permanent token:
		- Enter "business manager" -> "System users" (https://business.facebook.com/settings/system-users)
		- Create new system user with "admin" type
		- Add assets for this user (application with permission "application testing"
		- Use "generate new token"
	- Send test message:

<details><summary>Request /messages</summary>
<p>
``` json
https://graph.facebook.com/v13.0/{{phone_number_id}}/messages
  Authorization: Bearer {{TOKEN}}

{
  "messaging_product": "whatsapp",
  "recipient_type": "individual",
  "to": "XXXXX",
  "type": "text",
  "text": {
    "preview_url": false,
    "body": "MESSAGE_TEXT"
  }
}
```
</p>
</details>

-  Nova.BotFlow: Integration with Line messenger. [:clipboard: NOV-423] [NOV-423]
	- Added integration with line messenger.

<details><summary>Features</summary>
<p>
```
	    Text message
Both directions: agent  client, client  agent
• Maximum character limit is 5000

		Pictures
Both directions: agent  client, client  agent
• Formats: JPEG, PNG
• Maximum image size: no limit
• Maximum file size: 10MB

		Files
Both directions: agent  client, client  agent
• File size up to 300MB
• There is a storage period of 30 days only for files larger than 50MB
• The total storage (Keep) limit is 1GB
• Most items can be saved in Keep for any length of time
• Maximum length of video: no limit
• Maximum video file size: 200MB (unofficially, can be up to 300MB, but only if there wont be API timeout)

		Emoji
Both directions: agent  client, client  agent
• Maximum of 20 LINE emoji's

		Quick Replies
Quick Replies are supported as a disappearing after click/tap buttons
• Type: quickReply
• Maximum content length is 5000 characters
• Maximum 13 buttons
• Maximum label length is 20 characters

		Card
Card is supported as a monolith structure of Picture, Title with Subtitle and buttons
• Type buttons template
• Maximum label length is 20 characters
• Maximum title length is 40 characters
• Maximum subtitle length is 60 characters

		Button List
Button List is supported as a Content with number of buttons positioned vertically
• Type Flex message
• Maximum label length is 20 characters

		Button Grid
Button Grid is supported as a Content with number of buttons positioned vertically
• Type Flex message
• Maximum label length is 20 characters

		Carousel
Carousel is supported as a number of Card type messages, where every card may have buttons (different, if needed)
• Type: carousel template
• Maximum 10 cards
• Maximum label length is 20 characters
• Maximum title length is 40 characters
• Maximum subtitle length is 60 characters
• All messages in a carousel must have the same number of images, buttons, and fields
• Pictures are must be in JPEG or PNG image with a maximum width of 1024 pixels. The image URL maximum is 1,000 characters
```
</p>
</details>

####Bug Fixes
-  *WhatsApp* Nexmo (Vonage). Implementation List Messages for WhatsApp (for ChatBot) [:clipboard: NOV-415] [NOV-415]
	- Implemented support for WhatsApp List Messages (List Picker):

		• Maximum a menu of up to 10 options
		
		• Maximum header length 60 characters 
		
		• Maximum message length 1,024 characters
		
		• Maximum footer length up to 60 characters
		
		• Maximum label length (button text) up to 20 characters
		
		• List of items must have at least one section
		
		• List section must contain at least one item


-  Request is not sent via sender. [:clipboard: NOV-421] [NOV-421]
	- Fixed sending phone number and geolocation request.
	> Added support for requesting a number \ location using the keyboard.
	
	> Visually displayed telegram support for this type of keyboard buttons.

-  NovaBotflow. GenesysPureCloud more than one configurations does not work. [:clipboard: NOV-414] [NOV-414]
	- Fixed inability to write to GenesysPureCloud with more than 1 connection configuration.
	> Two or more configurations which use the same AWS region could overwrite each others authorization data.


	
***
###2022R3-5 :briefcase: Epic
####New Features
- none

####Bug Fixes
- none
***

###2022R3-4 :briefcase: Epic
####New Features
- *Genesys*: Integration with Genesys Cloud BotConnector [:clipboard: NOV-407] [NOV-407]

[BotFlow to Genesys Cloud BotConnector integration](https://drive.google.com/drive/folders/1whTZvHG4W63oKRtS3eX2e3L0r2dcbhIH)

- *WhatsApp (Nexmo\Vonage)*: Buttons implementation buttons for ChatBot [:clipboard: NOV-406] [NOV-406]

	- Quick Replies as Postback Buttons

	- Buttons as Postback Buttons
	
	- Support of URL buttons
	
	> postback buttons do not dissappear from view after postback

####Bug Fixes
- *WhatsApp Business*: Running of multiple browsers [:clipboard: NOV-413] [NOV-413]

	- added **--disable-dev-shm-usage**

	- correct stop of unwanted browsers (reload, etc.)
	
***

###2022R3-3 :briefcase: Epic
####New Features
- *Genesys*: Genesys In (Open Messaging API) improvement [:clipboard: NOV-400] [NOV-400]

	- changed UserId template **{{value}}** to **{{{value}}}** because special symbols are translated into url encoding
	
	> client's data - id, name, etc. - is saved in global context

- *WhatsApp*: R&D WhatsApp API Client via NodeJS Web Browser App [:clipboard: NOV-364] [NOV-364]

	- Developed new channel of whatsapp business based on **whatsapp-web.js** library with support of:

		• text

		• image

		• attachments

		• video

		• location

		• client's contact information sharing

- *Instagram*: Instagram Wallpost Support [:clipboard: NOV-381] [NOV-381]

	> receive events on messages in post comments on client's page

	> only text messages

- *All*: ChatWoot migration to got.js library [:clipboard: NOV-405] [NOV-405]

	> All send request methods (sendMedia, getMediaPayload) in nodes were migrated

####Bug Fixes
- none

***

###2022R3-1-2 :briefcase: Epic
####New Features
- *All*: Add sender_type and sender_id for BotAgent messages ignoring [:clipboard: NOV-403] [NOV-403]

	> added fields **sender_type** and **sender_id** for *outgoing* BotAgent messages

- *Instagram*: Instagram messages support [:clipboard: NOV-380] [NOV-380]

	- Connector In does support types:

		• Message with text

		• Message with media (image, video, file,audio)

		• Shares (media/post shares) - same as image

		• Story replies - same as image with caption

		• Inline message replies

		• Stickers (in .gif format)

		• Quick Replies

		• Icebreaker, Generic Template

		• ig.me with referral parameter (**ref** parameter will be written in **payload.ref**)

	- Connector Out does support types:

		• Text

		• Image

		• Generic Template

		• Quick replies

		• Buttons - same as Quick Replies

		• Icebreakers (in node config)

####Bug Fixes
- *Genesys*: fixed Genesys In node - Bad Request on sending attachments [:clipboard: NOV-399] [NOV-399]

	> **Genesys In** took sessions by **payload.userId** and not by template

	> Bad Request on sending attachments exist on 2+ Receiver nodes

	> (all ChatPlatform exemplars (viber 1, viber 2, ...) have their own endpoint **/files**)

- *All*,*ChatWoot*: fixed ChatWoot nodes dropping rich media formats [:clipboard: NOV-386] [NOV-386]

	> made for old and new core

	> rich media types are stored in the **items** json object 

***

##2022R2
###2022R2-4 :briefcase: Epic
####New Features
- *Facebook*: Facebook and Instagram [:clipboard: NOV-378] [NOV-378]

	- Steps to receive client's application token:

		• Step 1: Install App and Get long_lived_token
		```json
		Request:
		https://www.facebook.com/v14.0/dialog/oauth?
			client_id={app-id}&
			scope={scope}&
			response_type=token,granted_scopes&
			redirect_uri={redirect-uri}&
			state={state-param} 

		Response:
		access_token
		data_access_expiration_time
		expires_in
		long_lived_token
		granted_scopes
		denied_scopes
		state={state-param}
		```
		
		• Step 2: Get User id
		```json
		Request:
		https://graph.facebook.com/me?
			fields=id&
			access_token={access_token}

		Response:
		{
		"id": "{user-id}"
		} 
		```

		• Step 3: Get a Long-Lived Page Access Token
		```json
		Request:
		https://graph.facebook.com/v14.0/{user-id}/accounts?
			access_token={long-lived-user-access-token}   

		Response :
		{
		"data": [
			{
				"access_token": "SOMETOKEN",
				"category_list": [
					{
					"id": "SOMEID",
					"name": "SOMENAME"
					}
				],
				"name": "SOMENAME",
				"id": "SOMEID",
				"tasks": [
					"ANALYZE",
					"ADVERTISE",
					"MESSAGING",
					"MODERATE",
					"CREATE_CONTENT",
					"MANAGE"
				]
			}
		],
		"paging": {
			"cursors": {
				"before": "...",
				"after": "..."
			}
		}
		}   
		```

	- Documentation:
	
		• [Manually Build a Login Flow](https://developers.facebook.com/docs/facebook-login/guides/advanced/manual-flow)
		
		• [Long-Lived Access Tokens](https://developers.facebook.com/docs/facebook-login/guides/access-tokens/get-long-lived)
	
	- [Access Token Debug Tool](https://developers.facebook.com/tools/debug/accesstoken/)
	
	- What does "Data Access Expires" mean for a page access token
	
		• [Question in Community](https://developers.facebook.com/community/threads/1269366593224536/)

		• [Authentication Versus Data Access](https://developers.facebook.com/docs/facebook-login/auth-vs-data/)

####Bug Fixes
- none
***

###2022R2-3 :briefcase: Epic
####New Features
- *Telegram*: **parse_mode** for telegram [:clipboard: NOV-374] [NOV-374]

	- added node in the standard flow to set **parseMode** value in message payload which is processed and sent as **parse_mode** in request to Telegram API

	> value is set in **payload.params.parseMode**

	> value can be **Markdown** or **HTML** (**MarkdownV2** is not working)

####Bug Fixes
- *Telegram*: Fixed BotAgent In done malfunctionin on Botflow start [:clipboard: NOV-375] [NOV-375]

	> BotAgent In (chatbot-chatwoot-botagent-node) is not working at the start of Botflow when ChatWoot is inaccessible
	
	- Made via **polling**: will reask status every 1 minute until answered

***

###2022R2-2 :briefcase: Epic
####New Features
- *Genesys*: Genesys Open Messagin API connection node [:clipboard: NOV-345] [NOV-345]

	> **Genesys In** and **Genesys Out** nodes (receiver and sender namely)

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
- *All*: Message throttle (message antispam) node [:clipboard: NOV-368] [NOV-368]

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

- *All*: Redis expiration parameter for keys [:clipboard: NOV-353] [NOV-353] 

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
- *WhatsApp (Nexmo\Vonage)*: migration from API v0.1 to API v1 [:clipboard: NOV-309] [NOV-309]
- *WhatsApp (Nexmo\Vonage)*: backwards compatibility with API v0.1 [:clipboard: NOV-309] [NOV-309]

####Bug Fixes
- none
***

##2021R4
####New Features
- *All*: Developed **Message Queue** node with ability to store messages and retrive then on request [:clipboard: NOV-290] [NOV-290]

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

- *All*: RedBot 0.19.11 new functionality transfer to Nova.Botflow [:clipboard: NOV-282] [NOV-282]
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
- *All*: added outbound messages [:clipboard: NOV-239] [NOV-239]:
	
	• without specific answer redirect on agent or workgroup\skillgroup 
	
	• with reservation of agent or workgroup\skillgroup after outbound message and specific answer redirect on agent or workgroup\skillgroup
	
	• with reservation of agent or workgroup\skillgroup after client's reply and specific answer redirect on agent or workgroup\skillgroup

- Extended support of Rich Media for Omilia [:clipboard: NOV-176] [NOV-176]
- Added ChatProxy support for existing channels [:clipboard: NOV-177] [NOV-177]
- Enhanced webhook implementation for channels [:clipboard: NOV-183] [NOV-183]

	• Webhooks are following one set URL template (excluding Apple channel)

	• Few bots can be setup on one channel at the same time (in different flows or with switch)

- *WhatsApp (Infobip)*: added support of channel [:clipboard: NOV-184] [NOV-184]
- *All*: added **sessionRefreshTimeout** to **Omilia** conversations [:clipboard: NOV-188] [NOV-188]

	• Mechanism: at the start of conversation sets timer that every time checks if there were messages from client in set timeframe, if messages weren't sent, then it throws up **No Input** event to Omilia

- *All*: added functionality to call second Omilia app [:clipboard: NOV-189] [NOV-189]

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
- *WhatsApp (Nexmo\Vonage)*: added support of channel [:clipboard: NOV-158] [NOV-158]
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