{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.Genesys.PureConnect.InteractionConnect
##Product Notices
***
##2021R4
###2021R4-5
####New Features
- *NovaTalks.UI*: login using UID [:clipboard: NC2-53] [NC2-53]

	> Done for InteractionConnect NovaTalks widget

	• Logging in uses *UID* field instead of *email*

	• Genesys auth when auth token exists will send it to a Core istead of login and password

- *NovaTalks.InteractionConnect*: Sending of Genesys token on login in NovaTalks [:clipboard: NC2-55] [NC2-55]

	> Done for InteractionConnect NovaTalks widget

	• Catching of temporary token on login session start

	• Reaction on conversation change in InteractionConnect

- *NovaTalks.Core*: authorization in Genesys using temporary token [:clipboard: NC2-56] [NC2-56]

	> Done for InteractionConnect NovaTalks widget
	
	When token parameter HTTP is present from UI, it will be used for authorization (jointly with login)

	> Temporary token is valid for 7 seconds
	
<details><summary>Request payload example</summary>
<p>
```
{
"username": "1000",
"authToken": "VDEwMDBYCUNoYXQgQXV0aFgkOThjYWRkZjEtYzEyYy00NzcwLWFlMWUtZDEzY2FhYzk1MTUxWAwzNy43My4xNjcuNDdYJGQxOTAxZjY1LTQ2OWItNGZjNi1iMzUwLTE3ZDU5OTYxNWQ4OQ==",
"authTokenSourceSession": "3316227001",
"authTokenSeed": "d1901f65-469b-4fc6-b350-17d599615d89",
"applicationName": 'Chat Auth'
}

• authToken - token received from Genesys
• authTokenSourceSession - Genesys session ID which is used for token generation
• authTokenSeed - authTokenSeed which is used in token generation request
```
</p>
</details>

- *NovaTalks.UI*,*NovaTalks.Core*: UI adaptation to work with solitary Engine [:clipboard: NC2-57] [NC2-57]
	

	- **NovaTalks.UI**:

		• login with "Genesys Settings" not checked in.
	
		> When it is not checked in and it is Genesys auth, then "No Station" option will be choosen by default

		• user Activation\Deactivation 

		• provider on Profile and Agents pages

		• user edditing for administrators

		• administrator creation (all providers, except genesys)

		• agent creation (only with genesys provider)

	- **NovaTalks.Engine**:

		• added provider on agents' synchronization

		• deleted custom attribute {"genesysSync": true} on agents' synchronization

####Bug Fixes
- none
***


###2021R4-3
####New Features
- *NovaTalks.ChatProxy*: ChatProxy :material-arrow-right: ChatWoot connector [:clipboard: NC2-26] [NC2-26]

- *Nova.Chats*: UI extension [:clipboard: NC2-27] [NC2-27]

	- **Logo**:

		Logo icon: on Login and Dashboard pages

	- **Left sidebar**:

		Conversations tab

	- **op right pannel**:

		Icon: add "..." button to entry Settings

	- **Account settings fields**:

		Image: editable

		Full Name: non-editable

		Display Name: editable

		Email Address: non-editable

		Language: editable (only administrator)
	
	> Administrator changes system language for himself and his created agents

- *NovaTalks.Core*: CRUD methods for Agents [:clipboard: NC2-34] [NC2-34]

	• Login: check if "cofirmed_at" != NULL

	> api/v1/accounts/accountId/agents/agentId/login

	• Delete: set "cofirmed_at" to NULL

	> api/v1/accounts/accountId/agents/agentId/delete

	• Activate: activate Agent

	> api/v1/accounts/accountId/agents/agentId/activate

	• Deactivate: deactivate Agent

	> api/v1/accounts/accountId/agents/agentId/deactivate

	• PermanentDelete: delete Agent

	> api/v1/accounts/accountId/agents/agentId/permanentDelete

- *Nova.Chats*: BotAgent development [:clipboard: NC2-32] [NC2-32] (The task has been extended with [:clipboard: NOV-299] [NOV-299])

	- **Implementation specifics**:

		• BotAgent is a system agent
	
		• Realized as an additional Nova.Chats View in the agent workplace
	
		• Agent's credentials in Widget are the same as in workplace
	
		• Synchronization of actions made in widget and workplace
	
		> actions with conversations: pickup, disconnect, transfer 
	
		> agent's statuses: online, busy, offline
	
		• Telegram plus BotAgent: works without problems on API Inbox
	
		• Telegram Inbox plus buttons: doest not have integrated buttons 
	
		• Website Inbox plus buttons: widget uses his own endpoints (api/v1/widget) to send messages to ChatWoot

		• Rich Media are visible in agent's workplace as a title without buttons
	
		• Only one bot per inbox

		• "transfer" word transfers on operators' team
	
		> default behaviour, if client didn't specify team's or agent's name
	
		> transfer on agent or team can be initiated at any time

	- **Rich Media payloads available in ChatWoot**:

		• "input_select": same as "quick replies" or "inline-buttons" in BotFlow
	
		• "cards": same as "generic-template" in BotFlow
	
		> buttons can be added to the "card", but Web Widget would not react to them

		• "input_email": in BotFlow conform to text message asking to enter Email
	
		> renders as a field to enter Email value in Web Widget 
	
		• "article": same as "inline-button" (type: url) or "rich-link" in BotFlow

	> Inbox webhook will receive events with "content_type" and "content_attributes"

####Bug Fixes
- *Nova.Chats*: UI [:clipboard: NC2-39] [NC2-39]

	• UI: hidden "Notifications" icon (bell)

	• UI: buttons intersection in Russian locale

	• User Sync: added Genesys user attribute to synchronized users 

	• User Sync: synchronized users are added to Inbox
  
	> configuration has "apiInboxId" which tie created user to Inbox

	• User Sync: all users synchronized as agents
  
	> no relation to roles, only on "NovaTalks.sync": "true" attribute value

	• Admin UI: force Genesys user synchronization button

	• Admin UI: shows in "Agents" menu - "Provider" column if user is local or synchronized from Genesys

	• Admin UI: restriction on Genesys users edititng, only deletion

	• Admin UI: local administrators can change password and not reset password

	• User UI: "Change Password" option changes password Genesys (agents) or locally (administrators)

	• User UI: shows in "Profile Settings" - "Provider" if it is Genesys or local user

- *Nova.Chats*: UI [:clipboard: NC2-41] [NC2-41]

	- Genesys station droplist choose option (active only with Genesys Settings checkbox checked)
		
		• No Station
	
		• Workstation
	
		• Remote Workstation
	
		• Remote Number
	
	- Dashboard redirect on zero conversations

	- Genesys-ChatWoot mapping
		
		• config has "online" and "busy" statuses mapping

<details><summary>Envirounment variables in config</summary>
<p>

```		
SERVER_HOST=0.0.0.0
SERVER_PORT=3001
RUBY_HOST=http://srv-captain--novachats2-demo-chatwoot-web:3000
GENESYS_HOST=https://pureconnect.demo.novait.com.ua/api/192.168.124.160
NOVA_CHATS_ENGINE_HOST=http://srv-captain--novachats2-demo-engine:3000
NOVA_CHATS_PURECONNECT_CONNECTOR=http://srv-captain--novachats2-demo-pureconnect-connector:8000
GENESYS_STATUS_ONLINE=Available
GENESYS_STATUS_BUSY=Do Not disturb

GENESYS_STATUS_ONLINE and GENESYS_STATUS_BUSY - statusId in Genesys.
If does not exist, then sort by alphabet and choose first by isAcdStatus (true for "ONLINE" and false for "BUSY")
```
</p>
</details>

***

###2021R4-2
####New Features
- *Nova.Chats*: Node.JS ChatWoot Backend expanding [:clipboard: NC2-4] [NC2-4]

	• Operator synchronization with Genesys without email verification
	
	• Function to reset email verification after operator creation

- *Genesys.PureConnect.Sync*: GenesysPureConnect:material-arrow-left::material-arrow-right:Chatwoot user mapping and synchronization [:clipboard: NC2-8] [NC2-8]

	> Users in Genesys must have Custom Attribute "NovaTalks.sync" with value "true"

	- Import of parameters:
	
		• Parameter "Email" will be crated automatically as "{user.id}@chats.local", or it can be written manually in: "Mailbox User":material-arrow-right:"IMAP and/or SMTP":material-arrow-right:"SMTP Email Address To Send To:"

		• Parameter "Name" in IC user configuration is listed as "IC Privacy Name"
	
		• Parameter "Display Name" same as "Name" parameter
	
- *Genesys.PureConnect*: API integration [:clipboard: NC2-30] [NC2-30]

	• Genesys checkbox on Login page

	• Chat "Pickup" button

	• Agent status

	• Limitation of message sending to one when "CanReply" parameter is equal to "false" 

####Bug Fixes
- none
***

###2021R3
####New Features
- *Genesys.PureConnect.Widget*: Interaction Connect Widget development [:clipboard: NC2-2] [NC2-2]

- *Nova.Chats*: ChatWoot Frontend migration to Node.JS [:clipboard: NC2-3] [NC2-3]
	
- *Nova.Chats*: InteractionConnect Widget simplified UI [:clipboard: NC2-5] [NC2-5]

	- **Contact card**:

		• Deleted: **Assign Agent**, **Assign Team**
		
		• Email now is non-editable

		• Deleted: **Social Profiles**, **Company Name**

	- **Conversations tab**:

		• Deleted tabs: **Unassigned**, **All**

		• Now status filters only have Open and Resolved

		• **Resolve** button is inactive if conversation has **Resolved** status

		• Deleted: "..." button (conversation settings)

	- **Setting tab**:

		• Not acessible to agents

	- **Login page**:

		• Deleted: **Create New Account** with the **signupEnabled** option in config

- *NovaTalks.Core*: Outbound messages from BotFlow, BotConnector [:clipboard: NC2-16] [NC2-16]

- *Genesys.PureConnect.Connector*: Core development for outbound messages [:clipboard: NC2-21] [NC2-21]

	- **ChatProxy**:

		• in config cunfigured sending of variable **nova_chatid** with value **{chatid}**

		• in config sending of variables **nova_userid** with value **{userid}**

		• in config sending of variables **nova_source** with value **{source}**

	- **Nova.PureConnect.Connector**:

		• receiving **nova_chatid** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

		• receiving **nova_userid** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

		• receiving **nova_source** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

	> Limitation: one contact for one channel

	> All client's interactions in one channel are stored in one conversation

	> Conversations are linked by **nova_chatid**, **nova_userid**, **nova_source**

- *Nova.Chats*: UI extension [:clipboard: NC2-23] [NC2-23]

	- **Contact Card**:

		• Icon: shows user's avatar 

		• Icon: if user's avatar is not available, shows messanger icon by it's type stored in Conversation's attributes

		> Channel name (source) extracted from field: **additionalAttributes.contactSource**

		> Icons are stored in ./assets/dashboard/images/channels

	- **Contact Card - contact header**:

		• Mini icon: shows messanger icon by it's type stored in Conversation's attributes

		> Icons are stored in ./assets/dashboard/images/channels

		• Mini title: prints messanger name from it's type stored in Conversation's attributes

		> Channel name (source) extracted from field: **additionalAttributes.contactSource**

	- **Conversations tab**:

		• Filters: added "All" option

	> All conversations are realized as concatenation on **Open** and **Resolved** conversations

	> Concatenation result is stored in Vue store

<details><summary>"additionalAttributes"</summary>
<p>
```
Sent to genesys	format:

additionalAttributes: {
      nova_contactName: '{firstname} {lastname}',
      nova_contactEmail: '{userid}@{source}',
      nova_contactChatId: '{chatId}',
      nova_contactUserId: '{userid}',
      nova_contactChannelId: '{channel}',
      nova_contactSource: '{source}',
	  
	  Restriction:
	  without "contactSource" parameter the avatar wouldn't showup
   }
```
</p>
</details>

####Bug Fixes
- none
***