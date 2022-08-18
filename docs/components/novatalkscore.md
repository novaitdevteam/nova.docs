{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.Core
##Product Notices
***
##2022R3
###2022R3-3 :briefcase: Epic
####New Features
- *NovaTalks.Core.BA*: Increase of dialog filtering parameters [:clipboard: NC2-192] [NC2-192]

> The this task is unification of tasks:

> [:clipboard: NC2-135] [NC2-135]

> [:clipboard: NC2-136] [NC2-136]

> [:clipboard: NC2-137] [NC2-137]

> [:clipboard: NC2-138] [NC2-138]

[Contact and Conversation filtering](./documents/novatalks/NC2-223_Додаткова_фільтрація_Зміни_в_розділі_Contacts_v0.1(NovaTalks).docx.pdf)

- *NovaTalks.Core.BA*: Development of new transfer on agent methods [:clipboard: NC2-220] [NC2-220]

[Most available agent (MAA) specification](./documents/novatalks/NC2-220_Додаткові_схеми_авторозподілу_діалогів_v0.1(NovaTalks).docx.pdf)

####Bug Fixes
- none

***

###2022R3-1-2 :briefcase: Epic
####New Features
- *NovaTalks.Core.BA*: Post Call Survey (CSAT) [:clipboard: NC2-192] [NC2-192]

[CSAT specification - stage 1](./documents/novatalks/NC2-192_1_Post_Call_Suvey_v0.1(NovaTalks).docx.pdf)

[CSAT specification - stage 2](./documents/novatalks/NC2-192_2_Post_Call_Suvey_v0.2(NovaTalks).docx.pdf)

- *NovaTalks.Core.BA*: Porting *Mentions* to NovaTalks [:clipboard: NC2-210] [NC2-210]

	> porting functionality in the same way in works in the ChatWoot

- *NovaTalks.Core*: DB Script Migration [:clipboard: NC2-236] [NC2-236]

	> migration of Old ChatWoot database with client's data to new the ChatWoot database

- *NovaTalks.Core*: 016.002 Widget Frontend Refactoring [:clipboard: NC2-99] [NC2-99]

	> Messages API: 3 methods were done

- *NovaTalks.Core*: 016.002 Widget API Migration [:clipboard: NC2-98] [NC2-98]

	> Contacts API: 3 methods were done

	> Conversations API: 2 methods were done

	> Messages API: 3 methods were done

- *NovaTalks.Core*: Automated run of SQL migration script on service start [:clipboard: NC2-193] [NC2-193]

- *NovaTalks.Core*: assignee_changed and team_changed events emission [:clipboard: NC2-233] [NC2-233]

####Bug Fixes
- *NovaTalks.Core*: Beta-version bug fix [:clipboard: NC2-196] [NC2-196]

	- fixed various basic functionality items broken by migration

	- fixed Contact filter evoking leftover */compaigns* request

	- fixed doing Update Profile after deleting avatar requests deleted avatar from disk cache

	- fixed manually created users always have Online status

	- fixed WebSocket stability issues

	- fixed wrong *sender_type* for messages in database

	- fixed system messages not changing localization

	- standalone ukrainian localization without usage of denmark substitution

	- reports without data now visualize with 0 in metrics and can be downloaded currectly

	- fixed *reporting_events* not showing currect *user_id*

	- fixed system message in preview on media last message in dialogue

	- system messages are now dynamic

	- fixed wrong timezone in reports

	- fixed error message on wrong format contact creation *csv* file

	- fixed clean up of leftover elements in DB on contact deletion

	> elements: private notes, labeling, system messages, attachments

***

##2022R2
###2022R2-5 :briefcase: Epic
####New Features
- *NovaTalks.Core*: 010 Application API Migration - Custom Filter [:clipboard: NC2-91] [NC2-91]

	> Custom Filter: 5 methods were done

- *NovaTalks.Core*: 009 Application API Migration - Teams [:clipboard: NC2-90] [NC2-90]

	> Teams: 5 methods were done

- *NovaTalks.Core*: Implement swagger-stats (Swagger API Telemetry and APM Monitoring) functionality [:clipboard: NC2-174] [NC2-174]

	> Can be switched on\off via envirounment variable **SWAGGER_STATS_ENABLE** in the configuration file (by default: false)

- *NovaTalks.Core*: 016.001 Widget Frontend Analisys for Refactoring [:clipboard: NC2-97] [NC2-97]

- *NovaTalks.Core.BA*: DB additional events gathering for historical reports [:clipboard: NC2-176] [NC2-176]

[BD's additional events logging](./documents/novatalks/NC2-176_1_БД_Логування_додаткових_подій_v0.3(NovaTalks).docx.pdf)

[New table with agents' events](./documents/novatalks/NC2-176_2_БД_NewTable_Події_операторів_v0.1(NovaTalks).docx.pdf)

- *NovaTalks.Core*: 018 Internals - Online Status tracker [:clipboard: NC2-171] [NC2-171]

- *NovaTalks.Core*: WebSocket extension to support ChatWidget [:clipboard: NC2-180] [NC2-180]

- *NovaTalks.Core*: 008 Application API Migration - Profile [:clipboard: NC2-89] [NC2-89]

	> Profile: 1 method was done

- *NovaTalks.Core*: Dynamic configuration for migration scripts (envirounment variables) [:clipboard: NC2-194] [NC2-194]

- *NovaTalks.Core*: 014 Application API Migration - Reports [:clipboard: NC2-95] [NC2-95]

	> Reports: 5 methods were made

####Bug Fixes
- none
***

###2022R2-4 :briefcase: Epic
####New Features
- *NovaTalks.Core*: 015 Client API Migration - Websocket Server NodeJS [:clipboard: NC2-96] [NC2-96]

	> Library: [ws](https://www.npmjs.com/package/ws)
	
	- Messages that server sends to workplace:
	
		• message.created
	
		• message.updated
	
		• conversation.created
	
		• conversation.status_changed
	
		• user:logout
	
		• page:reload
	
		• assignee.changed
	
		• conversation.typing_on
	
		• conversation.typing_off
	
		• conversation.contact_changed
	
		• presence.update
	
		• contact.deleted
	
		• contact.updated
	
		• conversation.mentioned
	
		• notification.created

- *NovaTalks.Core*: 004 Application API Migration - Conversation [:clipboard: NC2-85] [NC2-85]

- *NovaTalks.Core*: 005 Application API Migration - Conversation Assignment [:clipboard: NC2-86] [NC2-86]

- *NovaTalks.Core*: 007 Application API Migration - Messages [:clipboard: NC2-88] [NC2-88]

- *NovaTalks.Core*: 011 Application API Migration - Conversation Labels [:clipboard: NC2-92] [NC2-92]

- *NovaTalks.Core*: 001.002 Application API Migration - Application Jobs to Bulls MQ porting - Part 2 [:clipboard: NC2-123] [NC2-123]

####Bug Fixes
- none
***

###2022R2-3 :briefcase: Epic
####New Features
- *NovaTalks.Core*: 001.002 Application API Migration - Application Jobs to Bulls MQ porting - Part 1 [:clipboard: NC2-122] [NC2-122]

	- Jobs list:
	
		• action_cable_broadcast_job.rb
		
		> (event broadcasting on workplace)

		• contact_avatar_job.rb

		• contact_ip_lookup_job.rb

		• trigger_scheduled_items_job.rb

		• conversations_resolution_scheduler_job.rb

		• activity_message_job.rb

		• reopen_snoozed_conversations_job.rb

		• resolution_job.rb

		• user_mention_job.rb

		• labal_update_job.rb
	
####Bug Fixes
- none
***

###2022R2-2 :briefcase: Epic
####New Features
- *NovaTalks.Core*: Mechanism of events evoking on models [:clipboard: NC2-126] [NC2-126]

	> Sequalize v6 hooks [documentation](https://sequelize.org/docs/v6/other-topics/hooks/)

	- Sequelize Hooks Methods:
			
		- YourModel.beforeBulkCreate(callback)

		> The callback has the form: **(instances, options) => /\* ... \*/**

		- YourModel.beforeBulkUpdate(callback)

		> The callback has the form: **(options) => /\* ... */**

		- YourModel.beforeBulkUpdate(callback)

		> The callback has the form: **(options) => /\* ... \*/**

		- YourModel.beforeBulkDestroy(callback)

		> The callback has the form: **(options) => /\* ... \*/**

		- YourModel.afterBulkCreate(callback)

		> The callback has the form: **(instances, options) => /\* ... \*/**

		- YourModel.afterBulkUpdate(callback)

		> The callback has the form: **(options) => /\* ... \*/**

		- YourModel.afterBulkDestroy(callback)

		> The callback has the form: **(options) => /\* ... \*/**
		
	> Added validation and static methods to models

- *NovaTalks.Core*: 003 Application API Migration - Contacts [:clipboard: NC2-84] [NC2-84]

	> Contacts: 10 methods were migrated
	
	> Import contacts method from Row SQL Query due to bug in Sequalize

- *NovaTalks.Core*: 006 Application API Migration - Inbox [:clipboard: NC2-87] [NC2-87]

	> Inbox: 10 methods were migrated
	
####Bug Fixes
- *NovaTalks.Core*, *NovaTalks.BotAgent*: Added *chatwootconversationId* deletion in all redis db's [:clipboard: NC2-133] [NC2-133]

	> If client will write in two different bots connected to two different redis db's in contexts, it will create keys with information about dialogs in each of the db's.
	
	> When the client's contact is deleted from UI it will delete **chatwootconversationId** from the last dialog. 

	> In the second dialog, this parameter will remain and provoke **conversation not found** error which, in return, will broke bot.

***

###2022R2-1 :briefcase: Epic
####New Features
- *NovaTalks.Core*: 001 Application API Migration - Портирование Application Jobs to Bulls MQ [:clipboard: NC2-82] [NC2-82]

	> Choosen "Bull" Framework (Redis-based queue for Node) for message queue.

####Bug Fixes
- none
***

##2022R1
###2022R1-6 :briefcase: Epic
####New Features
- *NovaTalks.Core*: 002 Application API Migration - Agents [:clipboard: NC2-83] [NC2-83]

	> Agents: 5 methods were migrated 

- *NovaTalks.Core*: 001 Platform API Migration [:clipboard: NC2-81] [NC2-81]

	- **Platform**:

		Accounts: 4 methods were checked

		AccountUsers: 3 methods were checked

		AgentBots: 5 methods were migrated

		Users: 5 methods were checked

- *NovaTalks.Core*: 002.001 Auth API - Refactoring Module for Agent Logins (use JWT) [:clipboard: NC2-102] [NC2-102]

	> Static roles: 

	> 	• Admin

	> 	• Supervisor

	> 	• Agent

	> One user (agent) corresponds to one role
	
	> One API method can corresponding to few roles

- *NovaTalks.Core*: 002.001 Application API New - FileModule [:clipboard: NC2-106] [NC2-106]

	Support of the next file storage methods:

	• **local** - localy save media with sending it by service 

	> local storage (local file system) endpoints:

	>	• endpoint **/store** - upload media

	>	• endpoint **/store/:id/:filename** - download media
	
	• **S3** - uploading file on **AWS** with sending of cloud link

- *NovaTalks.Core*: 002.002 Application API New - ProfileModule [:clipboard: NC2-111] [NC2-111]

	> Method to work with users information (profile module and service to download avatars)

- *NovaTalks.DB*: 001 Create TypeORM Migration Procedures [:clipboard: NC2-80] [NC2-80]

####Bug Fixes
- none
***

###2022R1-5 :briefcase: Epic
####New Features
- *NovaTalks.Core*,*NovaTalks.BotFlow*: Modification after migration on ChatWoot v2.2.0 [:clipboard: NC2-75] [NC2-75]

	• Nova.Chats.Engine: override contact deletion method. Event **contact_deleted** will be sent on webhook.

	• Nova.BotFlow: deletion of **chatWootConversationId** from context for deleted contact on **contact_deleted** event in node **ChatWootConnectorOutNode**.

- *NovaTalks.Core*: Migration to ChatWoot v2.2 [:clipboard: NC2-68] [NC2-68]

####Bug Fixes
- none
***

###2022R1-4 :briefcase: Epic
####New Features
- *NovaTalks.Core*,*NovaTalks.UI*: Possibility analysis for adding new roles [:clipboard: NC2-74] [NC2-74]

	• System has only two roles: Administrator and Agent
	
	• Role matrix is not realized in ChatWoot API

####Bug Fixes
- none
***

###2022R1-2 :briefcase: Epic
####New Features
- *NovaTalks.Core*: Ruby Conversation Routing [:clipboard: NC2-64] [NC2-64]

	• [Assignment logic link](https://github.com/chatwoot/chatwoot/blob/v2.1.1/app/models/concerns/assignment_handler.rb)

	• [Sample method link](https://apidock.com/rails/Array/sample)

	> • If Inbox auto assignment is **ON**, assignment on agents goes by **Round Robin** algorithm

	> • If Team auto assignment is **ON**, assignment on agents goes by **Random**

####Bug Fixes
- none
***

###2022R1-1 :briefcase: Epic
####New Features
- *NovaTalks.Core*: Work with *message_updated* events [:clipboard: NC2-60] [NC2-60]

	> Usage of RichMedia will send *POST* request instead of sending *PATCH* request

####Bug Fixes
- none
***

###2021R4
###2021R4-5
####New Features
- *NovaTalks.Core*: LDAP authentification [:clipboard: NC2-38] [NC2-38]

	- **General information**:

		• Does support multiple authentification strategies
		
		> supports strategies of the same type: LDAP1, LDAP2, etc.)
	
		• Client can use only authentification that was choosen during registration
	
		• Authentification provider is shown in Profile Settings
		
		> Location of providers in ChatWoot database: table "Users", column "Provider", values "LDAP", "Genesys", or "Email")

		• Login and Password change is possible only for "email" authentification provider

	> • Added "username" field on registration which is shown in profile settings

	> • If user is registered not with Email provider, all the fields must be filled in (exept of password)

	> • Agents, administrators and super administrators have access only to their own account information
	
	> • One instance to work with multiple clients - BotFlow

	- **Service configuration modification**:

		• Added configuration in JSON format as an alternative to envirounment variables
		  
		> envirounment variables have the highest priority

		• Added ability to fill in authentification providers in auth.activeProviders
		
		> activeProviders - array with provider configurations

		• Added authentification provider configurations in auth.activeProviders.providers


	- **Authentification algorithm**:

		• Read from configuration body fields of POST request, where Login and Password are listed

		• Read from configuration activated authentification providers and their configuration 

		• After request on /auth/sign_in/ initiates search of user in ChatWoot database 
			
		> table "Users", search by "uid" which contains Email

	> If user is **not found**, then authentification is **failed**

	> If user is **found**, then authentification with provider witten in field user.provider is **initiated**


	- **Authentification providers**:

		• "gmail": authentification with Login and Password from ChatWoot database

		• "genesys": authentification with Genesys ICWS
		  (Genesys ICWS agent Login is saved in "user.uid" which can be used instead of Email in UI)

		• "ldap": authentification through LDAP server
	
	> GET endpoint /auth/active_providers which returns a list of activated providers (array with provider names)


<details><summary>LDAP parameters</summary>
<p>
```
url:              e.g. ldap://localhost:389

bindDN:           e.g. cn='root'

bindCredentials:  Password for bindDN

searchBase:       e.g. o=users,o=example.com

searchFilter:     LDAP search filter, e.g. (uid={{username)}}. Use literal {{username}} to have the given username used in the search

searchAttributes: Optional array of attributes to fetch from LDAP server, e.g. ['displayName', 'mail']. Defaults to undefined, i.e. fetch all attributes

usernameField:    Field name where the username is found, defaults to username

passwordField:    Field name where the password is found, defaults to password

tlsOptions:       Optional object with options accepted by Node.js tls module
```
</p>
</details>

- *NovaTalks.Core*: creation of users with different auth providers [:clipboard: NC2-43] [NC2-43]
	
	Related task [:clipboard: NC2-38] [NC2-38]

	- Created endpoint " /auth/active " to receive list of active auth providers

	- Active providers are listed in "cfg.default.json", located in the root of the repository
	
	- **Field format**: 
	
		• "activeProviders": ["email", "genesys", "ldap", "ldaps"]

	> If provider is deleted from the config, the users tied with provider wont be able to log in

- *NovaTalks.Core*: User creation with different provider authentification [:clipboard: NC2-43] [NC2-43]

	> Expanded API to support creation of new users with authentification provider

<details><summary>User creation payload example</summary>
<p>
```
* - new field

{
*displayName: "nickname"
 email: "name@gmail.com"
 name: "name"
*password: "qwerty"
*provider: "email"
 role: "agent\administrator"
*username: "name@gmail.com"
}
```
</p>
</details>

- *NovaTalks.Core*: authorization in Genesys using temporary token [:clipboard: NC2-56] [NC2-56]

	> Done for InteractionConnect NovaTalks widget
	
	• When token parameter HTTP is present from UI, it will be used for authorization (jointly with login)

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

		• login with "Genesys Settings" not checked in by default

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
- *NovaTalks.Core*: CRUD methods for Agents [:clipboard: NC2-34] [NC2-34]

	- All methods require *api_access_token*, that can be took from super administrator
	
		• Login: check if "cofirmed_at" != NULL

		> api/v1/accounts/accountId/agents/agentId/login

		• Delete: set "cofirmed_at" to NULL

		> api/v1/accounts/accountId/agents/agentId/delete

		• Activate: activate Agent

		> api/v1/accounts/accountId/agents/agentId/activate

		• Deactivate: deactivate Agent

		> api/v1/accounts/accountId/agents/agentId/deactivate

		• PermanentDelete: delete Agent

		api/v1/accounts/accountId/agents/agentId/permanentDelete

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
- none
***