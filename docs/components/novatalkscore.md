{%
   include-markdown "./links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.Core
##Product Notices
***
##2022R4
###2022R4-1-2-3-4 :briefcase: Epic
####New Features
- *NovaTalks.Core*: AgentBot role implementation, Part 1 [:clipboard: NC2-244] [NC2-244]

	- **AgentBot** inbox integrations have their own **access_token** to access Novatalks API
	- **access_token** is created and assigned to the integration on its creation
	- AgentBot's access_token has **administrator** rights
	
	> AgentBot is not a user and doesn't behave the same as them
	
	> AgentBot can not be assigned to conversation, added to inbox or team as a user

- *NovaTalks.Core*: AgentBot role implementation, Part 2 [:clipboard: NC2-245] [NC2-245]

	- AgentBot's access_token has **owner_type** == **AgentBot**
	- Messages sent via AgentBot's access_token have **sender_type** == **AgentBot** with a corresponding **sender_id**
	- Changed **disableChangeStatus** and its description in the sender nodes (Nova.Botflow) to work with new logic 
	- Disabled **content_attributes** sending (Nova.Botflow)
	- Generation of new WS events
		- event: "contact.updated"
		- event: "conversation.status_changed"
		- event: "message.created"
		
		> **data.sender.type** shows user type: **user**, **agent_bot**, **contact**

	- Messages sent via AgentBot's access_token change conversation status to **pending**
	- Messages sent via User's access_token change conversation status to **open**

- *NovaTalks.Core.BA*: Menu (IVR) [:clipboard: NC2-242] [NC2-242]

	- A visual form (tree) has been implemented, according to which the client can create a menu as needed
		-  For free, the client has the opportunity to create up to 5-10 points
		-  Displaying the IVR menu in the form of buttons (depending on the support of the messenger)
		-  Ability to assign a dialog to an operator/group depending on the selected menu item
		-  Ability to assign a tag to a client (category) depending on the selected menu item
		-  Output embedded text from the menu + the ability to attach a file


[Menu (IVR) TK](https://drive.google.com/drive/folders/1yrgBr7YQ8wh_YuhyDZn6E-RhJZgkqzkv)


[ChatBot TK](https://drive.google.com/drive/folders/1wl5w_mNff59Cdrz0BJfL9iI3zrFnDCjw)

- *NovaTalks.Core.BA*: Historical Reports, Implementation in UI [:clipboard: NC2-190] [NC2-190]

[Historical Reports TK](https://drive.google.com/open?id=13deOqiP48AeBU06GFQpStlYNl5PAXhs3&authuser=cristina.podoliuh%40novait.com.ua&usp=drive_fs)

- *NovaTalks.Core*: Implementation of the AgentBot role, Part 1 [:clipboard: NC2-244] [NC2-244]

	- Implemented authorization for agent bot.
	- Botagent token has admin roots.

- *NovaTalks.Core*: Implementation of the AgentBot role, Part 2 [:clipboard: NC2-245] [NC2-245]

	- Generate events when sending messages specifying the type of user (User, AgentBot)
	- Open Conversations from users of the User type (ignore AgentBot)
	- Creation of a dialogue during service on the agent
	- Correction of the chat status when the bot is connected

- *NovaTalks.Core*: Realtime Statistics - API for realtime endpoints [:clipboard: NC2-367] [NC2-367]

	- Implemented API for getting statistics:
		- **Get agent Status realtime**
		<details><summary>GET /api/v2/accounts/{accountId}/realtime/agent_status</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account

		inboxes - array[number] - (in query) - The numeric IDs of the inboxes

		teams - array[number] - (in query) - The numeric IDs of the teams

		status - string (in query) - The agent status
		```
		</p>
		</details>

		> Example for accountId 1, inboxes 1 and 2, teams 1 and status online:
		> /api/v2/accounts/1/realtime/agent_status?inboxes=1&inboxes=2&teams=1&status=online

		- **Get agent overview realtime**
		<details><summary>GET /api/v2/accounts/{accountId}/realtime/agent_overview</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account

		agents - array[number] (in query) - The numeric IDs of the agents
		```
		</p>
		</details>

		> Example for accountId 1 and agents 1 and 2:
		> /api/v2/accounts/1/realtime/agent_overview?agents=1&agents=2

		- **Get team overview realtime**
		<details><summary>GET /api/v2/accounts/{accountId}/realtime/agent_overview</summary>
		<p>
		```
		accountId
		number - (in path) - The numeric ID of the account

		teams
		array[number] - (in query) - The numeric IDs of the teams
		```
		</p>
		</details>

		> Example for accountId 1 and teams 1 and 2:
		> /api/v2/accounts/1/realtime/team_overview?teams=1&teams=2

		- **Get inbox overview realtime**
		<details><summary>GET /api/v2/accounts/{accountId}/realtime/agent_overview</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account

		inboxes - array[number] (in query) - The numeric IDs of the inboxes
		```
		</p>
		</details>

		> Here example for accountId 1 and inboxes 1 and 2:
		> /api/v2/accounts/1/realtime/team_overview?inboxes=1&inboxes=2

	- Fixed data collection in the database
	- Fixed collection of statistics for **dialogs** table

- *NovaTalks.Core*: Realtime Statistics - Changes in the database [:clipboard: NC2-351] [NC2-351]
	- Database has been changet according to [Database TK](https://drive.google.com/open?id=1rGq0MR07Uk3GjXWU0CdsxxOc__SZ-ULz&authuser=cristina.podoliuh%40novait.com.ua&usp=drive_fs)

- *NovaTalks.Core*: Cascade removal of custom_attribute in dialog, contact [:clipboard: NC2-338] [NC2-338]

	- In order to delete any custom attribute, it is enough to go to the contact or dialog and delete this attribute.

	- Request to delete attributes, where ${tableName} = 'conversations' or 'contacts' and '${attributeKey}' = custom_attribute key:
``` SQL
	UPDATE ${tableName} 

        SET custom_attributes = custom_attributes - '${attributeKey}' 

        WHERE id IN 

        (SELECT id FROM "public"."${tableName}" WHERE "public"."${tableName}"."custom_attributes" ? '${attributeKey}')

```


- *NovaTalks.UI/Core*: Performance improvement 2 [:clipboard: NC2-335] [NC2-335]

	- Added getting meta information (counters) about the conversations every 3.5 seconds.
	- Added a check for obtaining a user's avatar, there will be no request to obtain it from www.gravatar.com.

- *NovaTalks.Core*: Check Type and Role of Token Endpoint [:clipboard: NC2-383] [NC2-383]

	- GET auth/get_token_info - a new endpoint, returns data about the user by token.
	- NovaTalks In node - token verification has been added on deployment;	 it must be **ownerType = "User"**, otherwise - show the status (signature under the node).
	- BotAgent In node - similar, but **ownerType = "AgentBot"**.

####Bug Fixes

- *NovaTalks.UI/Core*: Agent does see all conversations without inbox membership [:clipboard: NC2-356] [NC2-356]

	- Fixed agent's ability to see all inbox's conversations without being its member.
	- Fixed agent's ability to see all team's conversations without being its member.
	- Fixed agent's ability to see custom filters related to the teams and inboxes that he is not a member of.
	- Fixed agent's ability to see WebSocket events related to the teams and inboxes that he is not a member of.
	- Fixed agent's ability to direct entry by url to the resources (conversations, conversations filter by inbox conversations filter by team ) that he is not a member of.

- *NovaTalks.CORE*: Add validation\limitation when creating and updating custom\additional attributes [:clipboard: NC2-337] [NC2-337]
	- Added validation on custom\additional attributes in contacts and conversations.
	- Additional attributes fields in the conversations: **botId**, **chatId**, **contactSource**.
	- Added validation on custom\additional attributes in contacts and conversations, and added validation on **content_attributes** in **messages**.
	- For custom\additional attributes there are a string limit of 255 characters and array of 1024 bytes.
	- For content_attributes there are a string limit of 255 characters and array of 2048 bytes (the array can hold buttons).
	- These values ​​can be changed in the Attributes decorator or not added at all (for developers).

- *NovaTalks.Core*: Endpoint return users, do not return User Type=System [:clipboard: NC2-406] [NC2-406]

	- The API now does not return users whose field **type** equals to **System** in the **users** table
	- These users cannot be deleted (for deletion, you need to manually change the user **type**)

- *NovaTalks.Core*: File not downloading [:clipboard: NC2-380] [NC2-380]

	- On core: fixed the "URI malformed" error when trying to download a file with incorrect (cyrylic letters and url encoding) name.
	- On botflow: getting the file name has been fixed; now if it has a Cyrillic name it will not be corrupted, but will remain original.

##2022R3
###2022R3-6 :briefcase: Epic
####New Features
- *NovaTalks.Core.BA*: Additional chats autoassigment schematics - Queues [:clipboard: NC2-319] [NC2-319]

	> autoassignment of unassigned conversations

[Additional chats autoassigment schematics - Queues](https://drive.google.com/drive/folders/1vEhGK7vabQL-n7c5CtolEJ74_s3I_wZg)

- *NovaTalks.Core*: Post Call Survey - Add configuration [:clipboard: NC2-225] [NC2-225]

	- API provided: CRUD methods for adding and changing notification settings.
	- Granted roles: for administrator, for user.
	- Recording of results provided.

	[Post Call Survey - specification](https://drive.google.com/drive/folders/1v8A5g681VFrooYz_mXkF2cH2BSENxIp_)

- *NovaTalks.Core.BA*: Realtime Statistics [:clipboard: NC2-105] [NC2-105]

[Realtime Statistics specification](https://drive.google.com/drive/folders/1x1b5JWdb8Kmw8sYO0o2lh9wQ-WDp8G83)

[Database changes specification](https://drive.google.com/drive/folders/1rGq0MR07Uk3GjXWU0CdsxxOc__SZ-ULz)


- *NovaTalks.Core*: MAA autodistribution - Actions from conversation if agent writes to completed or unassigned dialog
 [:clipboard: NC2-159] [NC2-159]

	> Added conversation toggle status to **Open** on Engine side when agent writes to resolved conversation.

	> Added agent self-assignment to conversation when he writes to unassigned resolved conversation.


- *NovaTalks.Core*: Autodistribution MAA - Implementation of the MAA algorithm for Team and Inbox [:clipboard: NC2-159] [NC2-159]

	> If the conversation is assigned to a team (field team_id != NULL):
	> the utilization of this conversation equals value of the utilization set in team settings.

	> If the conversation is not assigned to the team (field team_id = NULL):
	> the utilization of this conversation equals value of the utilization set in Inbox settings.

	> Added localization and error handling for the Priority attribute in Conversation Information (values ​​from 1 to unlimited).

	> When adding an agent to tim/inbox, the system distributes current dialogs in the queue to these agents.

	> Theme/inbox utilization can be set to 0.

####Bug Fixes
- *NovaTalks.Core*: Fixed comversation search performance [:clipboard: NC2-326] [NC2-326]

	• Built index **index_conversations_on_additional_attributes_chat_id** on **additional_attributes** field to improve conversation search performance 

- *NovaTalks.Core*: Fixed labels deletion from database on contact deletion [:clipboard: NC2-339] [NC2-339]

	> contact deletion erases all constrained with it entities

	• Deletion of client's contact will initiate cascade deletion of all taggings assosiated with it's **taggable_id**

	• Deletion of client's contact will initiate cascade deletion of all conversations assosiated with it's **taggable_id**, and, therefore, will also delete all taggings assosiated with deleted conversations' **taggable_id**

- *NovaTalks.Core*: NovaTalks.Core: gallery attachments brokes id incrementation [:clipboard: NC2-328] [NC2-328]

	• Fixed **storage_attachments** and **attachments** tables id shifting, when loading several attachments.

	
***

###2022R3-5 :briefcase: Epic
####New Features
- *NovaTalks.Core*: Write first to the client (WhatsApp Business) [:clipboard: NC2-256] [NC2-256]

	- New additional attributes to the inbox channels in database

	> example:

	>[{"can_write_first_to_a_new_client ": "1",

	> "channel_for_writing_first_to_a_new client": "whatsapp"}]

[Write first outbound messaging WhatApp Business](https://drive.google.com/drive/folders/1w2KQLIZM-3ovi4G2MBrHqX0_A_A85oiu)

- *NovaTalks.Core*: Filtration by addtional_attributes [:clipboard: NC2-301] [NC2-301]

|Attrbute name - attribute_key | Attribute values                            | Attribute models                       |
|:---:                         |:---:                                        |:---:                                   |
|status	                       | 'open','resolved','pending','snoozed','all' | "attribute_model": "standard"          |
|assignee_id                   | Integer                                     | "attribute_model": "standard"          |
|inbox_id	Число	           | Integer                                     | "attribute_model": "standard"          |
|team_id	Число	           | Integer                                     | "attribute_model": "standard"          |
|display_id	Строка	           | String                                      | "attribute_model": "standard"          |
|labels	Масив строк	           | String array                                | "attribute_model": "standard"          |
|Other	                       |                                             | "attribute_model": "custom_attributes" |

- *NovaTalks.Core*: Logging additional events into a database [:clipboard: NC2-186] [NC2-186]

[BD's additional events logging](https://drive.google.com/drive/folders/1rGq0MR07Uk3GjXWU0CdsxxOc__SZ-ULz)

[New table with agents' events](https://drive.google.com/drive/folders/1rM8kliZxhm96mg0zCGWIa_GLIy0mp1ka)

####Bug Fixes
- *NovaTalks.UI, Core*: Fixed problem when page refresh mark all conversations as seen [:clipboard: NC2-296] [NC2-296]

***

###2022R3-4 :briefcase: Epic
####New Features
- *NovaTalks.Core*: Notifications - add configuration [:clipboard: NC2-197] [NC2-197]

	- addition of API CRUD methods for adding and changing of the configurations settings

	- different roles for administrator and agent

[Notifications functionality specification](https://drive.google.com/drive/folders/1rU0RPuJ_wzQaDuXy6bsLxDKMB28RW3hb)

- *NovaTalks.Core*: Notifications - popup notifications on desktop [:clipboard: NC2-231] [NC2-231]

- *NovaTalks.Core.BA*: Ask phone number [:clipboard: NC2-231] [NC2-231]

	- Ask phone number (in telegram, viber, facebook) by button from the agent side in ongoing conversation 

	- Automized addition of phone number to the client's contact card

[Ask Phone number](https://drive.google.com/drive/folders/1wRa1aQuSd_sFk4zyjd7X-5aPUkKYyOrP)

####Bug Fixes
- *NovaTalks.Core*: Fixed syntax error in WebSite inbox creation request [:clipboard: NC2-273] [NC2-273]

***

###2022R3-3 :briefcase: Epic
####New Features
- *NovaTalks.Core.BA*: Increase of dialog filtering parameters [:clipboard: NC2-219] [NC2-219]

> The this task is unification of tasks:

> [:clipboard: NC2-135] [NC2-135]

> [:clipboard: NC2-136] [NC2-136]

> [:clipboard: NC2-137] [NC2-137]

> [:clipboard: NC2-138] [NC2-138]

[Contact and Conversation filtering](https://drive.google.com/drive/folders/1w-GVzNVPg_mm35mgExnmGWYBifvpMX-Y)

- *NovaTalks.Core.BA*: Development of new transfer on agent methods [:clipboard: NC2-220] [NC2-220]

[Most available agent (MAA) specification](https://drive.google.com/drive/folders/1vEhGK7vabQL-n7c5CtolEJ74_s3I_wZg)

####Bug Fixes
- none

***

###2022R3-1-2 :briefcase: Epic
####New Features
- *NovaTalks.Core.BA*: Post Call Survey (CSAT) [:clipboard: NC2-192] [NC2-192]

[CSAT specification - stage 1](https://drive.google.com/drive/folders/1v8A5g681VFrooYz_mXkF2cH2BSENxIp_)

[CSAT specification - stage 2](https://drive.google.com/drive/folders/1uHnkt0QCaXnVoF3vIPHXbx4lw4i8acRQ)

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

[BD's additional events logging](https://drive.google.com/drive/folders/1rGq0MR07Uk3GjXWU0CdsxxOc__SZ-ULz)

[New table with agents' events](https://drive.google.com/drive/folders/1rM8kliZxhm96mg0zCGWIa_GLIy0mp1ka)

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