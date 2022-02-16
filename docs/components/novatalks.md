{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#Nova.Talks
##Product Notices
***
##2022R1
###2022R1-1 :briefcase: Epic
####New Features
- 

####Bug Fixes
- none
***

###2021R4
###2021R4-4
####New Features

- *Nova.Chats.Standalone*: UI [:clipboard: NC2-36] [NC2-36]

	> • UI migration to ChatWoot v1.20.0

	> • ChatWoot logo changed to NovaIT logo

	> • Deleted mentions of versioning

	> • Authentification transfered on authentification module

	> • Hidden "delete" option in the chat messages options

- *Nova.Chats.Core*: LDAP authentification [:clipboard: NC2-38] [NC2-38]

<details><summary>General information</summary>
<p>
```
• Does support multiple authentification strategies
	(supports strategies of the same type: LDAP1, LDAP2, etc.)
	
• Client can use only authentification that was choosen during registration
	
• Authentification provider is shown in Profile Settings
	(Location of providers in ChatWoot database: table "Users", column "Provider", values "LDAP", "Genesys", or "Email")

• Login and Password change is possible only for "email" authentification provider

	> • Added "username" field on registration which is shown in profile settings

	> • If user is registered not with Email provider, all the fields must be filled in (exept of password)

	> • Agents, administrators and super administrators have access only to their own account information
	
	> • One instance to work with multiple clients - BotFlow
```
</p>
</details>

<details><summary>Service configuration modification</summary>
<p>
```
• Added configuration in JSON format as an alternative to envirounment variables
	(envirounment variables have the highest priority)

• Added ability to fill in authentification providers in auth.activeProviders
	(activeProviders - array with provider configurations)

• Added authentification provider configurations in auth.activeProviders.providers
```
</p>
</details>

<details><summary>Authentification algorithm</summary>
<p>
```
• Read from configuration body fields of POST request, where Login and Password are listed

• Read from configuration activated authentification providers and their configuration 

• After request on /auth/sign_in/ initiates search of user in ChatWoot database 
	(table "Users", search by "uid" which contains Email)

	- If user is not found, then authentification if failed

	- If user is found, then authentification with provider witten in field user.provider is initiated
```
</p>
</details>

<details><summary>Authentification providers</summary>
<p>
```
 • "gmail": authentification with Login and Password from ChatWoot database

 • "genesys": authentification with Genesys ICWS
	(Genesy ICWS agent Login is saved in "user.uid" which can be used instead of Email in UI)

 • "ldap": authentification through LDAP server
	GET endpoint /auth/active_providers which returns a list of activated providers (array with provider names)
```
</p>
</details>

<details><summary>LDAP parameters</summary>
<p>
```
• url: e.g. ldap://localhost:389

• bindDN: e.g. cn='root'

• bindCredentials: Password for bindDN

• searchBase: e.g. o=users,o=example.com

• searchFilter: LDAP search filter, e.g. (uid={{username)}}. Use literal {{username}} to have the given username used in the search

• searchAttributes: Optional array of attributes to fetch from LDAP server, e.g. ['displayName', 'mail']. Defaults to undefined, i.e. fetch all attributes

• usernameField: Field name where the username is found, defaults to username

• passwordField: Field name where the password is found, defaults to password

• tlsOptions: Optional object with options accepted by Node.js tls module
```
</p>
</details>

- *Nova.Chats.UI*: UI part for LDAP authentification [:clipboard: NC2-42] [NC2-42]
	Related task [:clipboard: NC2-38] [NC2-38]

> Provider field in "Add Agent" menu with options: "email", "ldap", "ldaps"

> "genesys" provider added only to users synchronized from Genesys ICWS

- *Nova.Chats.Core*: creation of users with different auth providers [:clipboard: NC2-43] [NC2-43]
	Related task [:clipboard: NC2-38] [NC2-38]

	> Fields sent are the same as per registration in UI:
	
	> Agent UserName

	> Email Address

	> Agent Display Name

	> Role

	> Provider

	> Password
	
####Bug Fixes
- none
***

###2021R4-3
####New Features
- *Nova.Chats.ChatProxy*: ChatProxy :material-arrow-right: ChatWoot connector [:clipboard: NC2-26] [NC2-26]

- *Nova.Chats*: UI extension [:clipboard: NC2-27] [NC2-27]

<details><summary>Extension items</summary>
<p>
```
Logo:

• Logo icon: on Login and Dashboard pages

Left sidebar:

• Conversations tab

Top right pannel:

• Icon: add "..." button to entry Settings

Account settings fields:

• Image: editable

• Full Name: non-editable

• Display Name: editable

• Email Address: non-editable

• Language: editable (only administrator)
	
	- administrator changes system language for himself and his created agents
```
</p>
</details>

- *Nova.Chats.Core*: CRUD methods for Agents [:clipboard: NC2-34] [NC2-34]

	> • Login: check if "cofirmed_at" != NULL

	> api/v1/accounts/accountId/agents/agentId/login

	> • Delete: set "cofirmed_at" to NULL

	> api/v1/accounts/accountId/agents/agentId/delete

	> • Activate: activate Agent

	> api/v1/accounts/accountId/agents/agentId/activate

	> • Deactivate: deactivate Agent

	> api/v1/accounts/accountId/agents/agentId/deactivate

	> • PermanentDelete: delete Agent

	> api/v1/accounts/accountId/agents/agentId/permanentDelete

- *Nova.Chats*: BotAgent development [:clipboard: NC2-32] [NC2-32]

The task has been extended with [:clipboard: NOV-299] [NOV-299]

<details><summary>Implementation specifics</summary>
<p>

```

 • BotAgent is a system agent
	
 • Realized as an additional Nova.Chats View in the agent workplace
	
 • Agent's credentials in Widget are the same as in workplace
	
 • Synchronization of actions made in widget and workplace:
	
 	- actions with conversations: pickup, disconnect, transfer 
	
 	- agent's status: online, busy, offline
	
 • Telegram plus BotAgent: works without problems on API Inbox
	
 • Telegram Inbox plus buttons: doest not have integrated buttons 
	
 • Website Inbox plus buttons: widget uses his own endpoints (api/v1/widget) to send messages to ChatWoot

 • Rich Media are visible in agent's workplace as a title without buttons
	
 • Only one bot per inbox

 • "transfer" word transfers on operators' team
	
   - default behaviour, if client didn't specify team's or agent's name
	
   - transfer on agent or team can be initiated at any time

```
</p>
</details>

<details><summary>Rich Media payloads available in ChatWoot</summary>
<p>

```

• "input_select": same as "quick replies" or "inline-buttons" in BotFlow
		
• "cards": same as "generic-template" in BotFlow
		
  (buttons can be added to the "card", but Web Widget would not react to them)

• "input_email": in BotFlow conform to text message asking to enter Email
	
  (renders as a field to enter Email in Web Widget)  
	
• "article": same as "inline-button" (type: url) or "rich-link" in BotFlow

Inbox webhook will receive events with "content_type" and "content_attributes" 
	
```
</p>
</details>

####Bug Fixes
- *Nova.Chats*: UI [:clipboard: NC2-39] [NC2-39]

<details><summary>Bugfix list</summary>
<p>

```
• UI: hidden "Notifications" icon (bell)

• UI: buttons intersection in Russian locale

• User Sync: added Genesys user attribute to synchronized users 

• User Sync: synchronized users are added to Inbox
  (configuration has "apiInboxId" which tie created user to Inbox)

• User Sync: all users synchronized as agents
  (no relation to roles, only on "nova.chats.sync": "true" attribute value) 

• Admin UI: force Genesys user synchronization button

• Admin UI: shows in "Agents" menu - "Provider" column if user is local or synchronized from Genesys

• Admin UI: restriction on Genesys users edititng, only deletion

• Admin UI: local administrators can change password and not reset password

• User UI: "Change Password" option changes password Genesys (agents) or locally (administrators)

• User UI: shows in "Profile Settings" - "Provider" if it is Genesys or local user

```
</p>
</details>

- *Nova.Chats*: UI [:clipboard: NC2-41] [NC2-41]

	> • Genesys station droplist choose option (active only with Genesys Settings checkbox checked)
		
	>	- No Station
	>	- Workstation
	>	- Remote Workstation
	>	- Remote Number
	
	> • Dashboard redirect on zero conversations
	
	> • Genesys-ChatWoot mapping
		- config has "online" and "busy" statuses mapping

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

	> • Operator synchronization with Genesys without email verification
	
	> • Function to reset email verification after operator creation

- *Genesys.PureConnect.Sync*: GenesysPureConnect:material-arrow-left::material-arrow-right:Chatwoot user mapping and synchronization [:clipboard: NC2-8] [NC2-8]

	> Users in genesys must have Custom Attribute "nova.chats.sync" with value "true"

	> Import of parameters:
	
	> 	- Parameter "Email" will be crated automatically as "{user.id}@chats.local", or it can be written manually in: "Mailbox User":material-arrow-right:"IMAP and/or SMTP":material-arrow-right:"SMTP Email Address To Send To:"

	> 	- Parameter "Name" in IC user configuration is listed as "IC Privacy Name"
	
	> 	- Parameter "Display Name" same as "Name" parameter
	
- *Genesys.PureConnect*: API integration [:clipboard: NC2-30] [NC2-30]

<details><summary>Integration items</summary>
<p>
```
• Genesys checkbox on Login page

• Chat "Pickup" button

• Agent status

• Limitation of message sending to one when "CanReply" parameter is equal to "false" 
```
</p>
</details>

####Bug Fixes
- none
***

###2021R3
####New Features
- *Genesys.PureConnect.Widget*: Interaction Connect Widget development [:clipboard: NC2-2] [NC2-2]

- *Nova.Chats*: ChatWoot Frontend migration to Node.JS [:clipboard: NC2-3] [NC2-3]
	
- *Nova.Chats*: InteractionConnect Widget simplified UI [:clipboard: NC2-5] [NC2-5]

<details><summary>Simplification items</summary>
<p>

```
Contact card:

• Deleted: "Assign Agent", "Assign Team"
• Email now is non-editable
• Deleted: "Social Profiles", "Company Name"

Conversations tab:

• Deleted tabs: "Unassigned", "All"
• Now status filters only have Open and Resolved
• "Resolve" button is inactive if conversation has "Resolved" status
• Deleted: "..." button (conversation settings)

Setting tab:

• Not acessible to agents

Login page:

• Deleted: "Create New Account" with the "signupEnabled" option in config
```
</p>
</details>

- *Nova.Chats.Core*: Outbound messages from BotFlow, BotConnector [:clipboard: NC2-16] [NC2-16]

- *Genesys.PureConnect.Connector*: Core development for outbound messages [:clipboard: NC2-21] [NC2-21]

<details><summary>Development items</summary>
<p>
```
• ChatProxy: in config cunfigured sending of variable "nova_chatid" with value {chatid}
• ChatProxy: in config sending of variables "nova_userid" with value {userid}
• ChatProxy: in config sending of variables "nova_source" with value {source}
• Nova.PureConnect.Connector: receiving "nova_chatid" value and sending it in "AdditionalAttribute" (entity "Conversation") 
• Nova.PureConnect.Connector: receiving "nova_userid" value and sending it in "AdditionalAttribute" (entity "Conversation") 
• Nova.PureConnect.Connector: receiving "nova_source" value and sending it in "AdditionalAttribute" (entity "Conversation") 
• Limitation: one contact for one channel
• All client's interactions in one channel are stored in one conversation
• Conversations are linked by "nova_chatid", "nova_userid", "nova_source"
```
</p>
</details>

- *Nova.Chats*: UI extension [:clipboard: NC2-23] [NC2-23]

<details><summary>Extension items</summary>
<p>
```
Contact Card:

• Icon: shows user's avatar 
• Icon: if user's avatar is not available, shows messanger icon by it's type stored in Conversation's attributes
	- Channel name (source) extracted from field: "additionalAttributes.contactSource"
	- Icons are stored in ./assets/dashboard/images/channels

Contact Card - contact header: 

• Mini icon: shows messanger icon by it's type stored in Conversation's attributes
	- Icons are stored in ./assets/dashboard/images/channels
• Mini title: prints messanger name from it's type stored in Conversation's attributes
	- Channel name (source) extracted from field: "additionalAttributes.contactSource"

Conversations tab:

• Filters: added "All" option
	- All conversations are realized as concatenation on Open and Resolved conversations
	- Concatenation result is stored in Vue store

```
</p>
</details>
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

###2021R2
####New Features
- *Genesys.PureConnect.Connector*: Core development [:clipboard: NC2-1] [NC2-1]

- *Genesys.PureConnect.Connector*: Notes:GenesysPureConnect :material-arrow-left::material-arrow-right: Notes:Chatwoot synchronization [:clipboard: NC2-11] [NC2-11]

- *Genesys.PureConnect.Connector*: Messages:GenesysPureConnect :material-arrow-left::material-arrow-right: Messages:Chatwoot synchronization [:clipboard: NC2-12] [NC2-12]

- *Genesys.PureConnect.Connector*: Agent Status:GenesysPureConnect :material-arrow-right: Agent Status:Chatwoot synchronization [:clipboard: NC2-13] [NC2-13]

- *Genesys.PureConnect.Connector*: Close conversation session on **Customer Left Session** event [:clipboard: NC2-14] [NC2-14]

####Bug Fixes
- none
***