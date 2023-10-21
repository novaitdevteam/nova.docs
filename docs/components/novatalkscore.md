{%
   include-markdown "./links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.Core
##Product Notices
***

##2023R3

###2023R3-1 :briefcase: Epic

####New Features

- *NovaTalks.Core*: Added LDAP Match Parameter [:clipboard: NC2-806] [NC2-806]

	Added **LDAP_USERNAME_ATTRIBUTE** environment variable which is used for LDAP integration to search user among attributes provided by LDAP.

- *NovaTalks.Core*: Added extra parameters for SSL database connection [:clipboard: NC2-798] [NC2-798]
	
	New environment variables to specify the connection to database with certificate:
	
	- "DATABASE_SSL_CA_CERT" - path to CA certificate

	- "DATABASE_SSL_ENABLED" - enable or disable SSL connection to database

	> When specifying only **DATABASE_SSL_ENABLED** parameter, an SSL connection will be established, and server side certificate verification will be ignored.

	> Implemented database schema migration over an SSL connection without certificate verification.

- *NovaTalks.Core*: Migration from Vuex to Pinia [:clipboard: NC2-708] [NC2-708]
	
	<details><summary>Migration for the following modules:</summary>
	<p>
	```
	- Pinia auth store module.
	- Notification Pinia module.
	- Account pinia module.
	- Conversation and contact modules.
	- Pinia message module.	
	```
	</p>
	</details>
	
	> **[Vuex](https://vuex.vuejs.org/)** is a state management pattern and library for Vue.js applications. It serves as a centralized store for all the components in an application, with rules ensuring that the state can only be mutated in a predictable fashion.
	
	> **[Pinia](https://pinia.vuejs.org/)**, which is a new default, is a store library for Vue, which allows to share a state across components/pages.

- *NovaTalks.Core*: Added support for *Adobe Illustrator* (.ai) format for files [:clipboard: NC2-809] [NC2-809]

	> Added new mimeType to support sending both ways.

- *NovaTalks.Core*: Updated "prosemirror-schema" library [:clipboard: NC2-752] [NC2-752]

	- Migrated new features from [prosemirror-schema](https://github.com/chatwoot/prosemirror-schema) to our repository.

- *NovaTalks.Core*: Added the "Automation" functionality [:clipboard: NC2-175] [NC2-175]

	Migrated "Automation" functionality from the ChatWoot to our component and added the following endpoints:
	
	<details><summary>/api/v1/accounts/{accountId}</summary>
	<p>
	```
	- GET /automation_rules
	- POST /automation_rules
	- GET /automation_rules/{automationRuleId}
	- PATCH /automation_rules/{automationRuleId}
	- DELETE /automation_rules/{automationRuleId}
	- POST /automation_rules/{automationRuleId}/attach_file
	```
	</p>
	</details>
	
	[Specification](https://sd.novait.com.ua/browse/NC2-211)
	

- *NovaTalks.Core*: Migrated emoji text editor support from Chatwoot [:clipboard: NC2-753] [NC2-753]

	> Added emoji support functionality to the text editor.
	
- *NovaTalks.Core*: Added long response notification settings [:clipboard: NC2-726] [NC2-726]

	- Added the "long_response_notification" column to the "accounts" table.
	
	- Long response timeout can be set in Account Settings - Conversations section with value in seconds.
	
	> Intended to highlight chats waiting for a response from the operator longer than the set timeout.	
	
	[Specification](https://drive.google.com/drive/folders/1SmYAhqDAioascfrsnkYdf2lQeJhvxoQr)
	
####Bug Fixes

- *NovaTalks.Core*: Optimized "Pin/Unpin" requests [:clipboard: NC2-776] [NC2-776]

	- Requests are not made unless pinned messages are present in a conversation.

	- Pinned messages are additionally retrieved from the database if they were not initially downloaded (21 messages).

- *NovaTalks.Core*: Fixed incorrect recalculation of ACD queue [:clipboard: NC2-801] [NC2-801]

	- Only agents with online statuses will enter the pool for the queue.

- *NovaTalks.Core*: Fixed WebSocket stability issues [:clipboard: NC2-785] [NC2-785]

	- Fixed problem with session token invalidation before timeout due to "**AUTH_LOGOUT_TIMEOUT**" environment variable.

- *NovaTalks.Core*: Fixed exceeding the account agent limit [:clipboard: NC2-750] [NC2-750]

	- Fixed the possibility to exceed agent limit by restoring any deleted agent.

	- Fixed error notification prompt when limit of the paid account agents in the system is reached.

***

##2023R2

###2023R2-5-6 :briefcase: Epic

####New Features

- *NovaTalks.Core*: Added request caching [:clipboard: NC2-676] [NC2-676]

	Request caching was added to the following endpoints:

	<details><summary>/api/v1/accounts/{accountId}</summary>
	<p>
	```
	- /canned_responses
	- /canned_responses/{cannedResponseId}		
	- /custom_attribute_definitions		
	- /custom_attribute_definitions/{customAttributeId}	
	- /dialogs/labels		
	- /labels		
	- /teams
	```
	</p>
	</details>


- *NovaTalks.Core*: Implemented the "Mentions" functionality [:clipboard: NC2-216] [NC2-216]

	- Added the ability to set the display of mentions in conversations for a specific number of days.
	
	- The number of days is counted using **mentioned_at** field in table **mentions**.

- *NovaTalks.Core*: Dynamic update of widget profile [:clipboard: NC2-571] [NC2-571]
	
	- Added a "Get settings from server" checkbox button in the Inbox settings, and now the widget settings will be updated automatically via a request to the NovaTalks server:

	<details><summary>GET /widget/settings</summary>
	<p>
	```
	- /widget/settings?website_token=${websiteToken}
	```
	</p>
	</details>
	
	<details><summary>Response example:</summary>
	<p>
	```
	{
	  "welcomeTitle": "Title ",
	  "widgetColor": "#FF0866",
	  "preChatFormEnabled": true,
	  "additionalSettings": {
		"locale": "en",
		"channels": [
		  {
			"hint": "telegram",
			"name": "asd",
			"type": "chat",
			"enabled": true,
			"url": "http://t.me/url"
		  }
		],
		"isWidgetDynamic": true,
		"showCloseWidgetIcon": true
	  },
	  "preChatFormOptions": {
		"calendar": {
		  "timezone": "Europe/Kyiv",
		  "workingHours": []
		},
		"online": {
		  "enabled": true,
		  "fields": [
			{
			  "name": "name",
			  "key": "key",
			  "required": true
			}
		  ]
		},
		"offline": {
		  "enabled": true,
		  "fields": [
			{
			  "name": "name",
			  "key": "key",
			  "required": true
			}
		  ]
		}
	  }
	}
	```
	</p>
	</details>

	[Dynamic widget profile update specification](https://drive.google.com/drive/folders/1BEg5Qnx8g0y7dkk8F50xYIRNsGCZ9f3s)

- *NovaTalks.Core*: Ported templates variables from Chatwoot [:clipboard: NC2-509] [NC2-509]

	By using **{{variable}}** in the following sections:

	- In the message sending panel "Reply" and "Private Note"

	- Canned Responses

	- Macros

- *NovaTalks.Core*: Added new channel type "Email" in Inboxes [:clipboard: NC2-636] [NC2-636]

	- Channel type "Email" allows connection of mail using the IMAP and SMTP/SMTPS protocols.
	
	New environment variables:
	
	- **EMAIL_FETCH_INTERVAL** - the interval at which we send a request to receive mail in milliseconds. 

	- **ENCRYPTION_SECRET** - secret of the data. Additional string for generating *secretKey*. One of the elements for *encryptData*.

- *NovaTalks.Core*: Added "Pin/Unpin" and "Reply" functionality to message [:clipboard: NC2-552] [NC2-552]

	- The order number of pinned message corresponds to the order in which the agent pinned it.
	
		> Changing the selected pinned message does not download additional conversarsation's message history.
	
	- Added the "pinned" column to the "messages" table.
	
	- Added the "pinned_messages" parameter to "additional_attributes" in the "conversations" table.

####Bug Fixes

- *NovaTalks.Core*: Fixed Engine error on sending files on webhook [:clipboard: NC2-703] [NC2-703]
	
	> Attempting to send a file in a conversation from the agent's side, files were added to the conversation and not sent on webhook.


- *NovaTalks.Core*: Fixed an issue when messages are not fetched on connection restablished [:clipboard: NC2-693] [NC2-693]
	
	> If a message is sent to the web widget and the connection with Engine is lost, the message will be fetched once the connection between web-widget and Engine is restablished.

- *NovaTalks.Core*: Fixed url encoding of cyrillic file names sent from Email inbox [:clipboard: NC2-678] [NC2-678]
	
	- Files which had cirillic characters in their name had them url encoded when sent to a client.

- *NovaTalks.Core*: Fixed conversarsation routing error [:clipboard: NC2-709] [NC2-709]

	> "NavigationDuplicated" Nuxt error.

***

###2023R2-3-4 :briefcase: Epic

####New Features

- *NovaTalks.Core*: The mechanism for changing agent statuses by the admin [:clipboard: NC2-631] [NC2-631]

	- Added ability (for role = admin) to change statuses and substatuses of agents.
	- In Settings -> Agent -> Edit Agent added new parameter **Aviability** (type - dropdown, available values - available statuses and substatuses).
	- Agent Log Out automaticaly when his status has been changed to offline.
	- In report Online -> Agent Status added new parameter **Aviability** and  ability to change status (for admin role).

	[Change status specification](https://drive.google.com/drive/folders/1J5LCUo58irnniHqXeIzaNFPaNyd7K9-h)

> Related task [:clipboard: NC2-633] [NC2-633]

- *NovaTalks.Core*: Dashboard apps: changes i DB [:clipboard: NC2-623] [NC2-623]

	- Migratet table **dashboard_apps** from chatwoot.
	- In table **dashboard_apps** added columns **active** (true/false) and **deleted_at**.
	- In table **users** in column **ui_settings** added property **added_apps** ([] with ids of added apps).

	[Dashboard apps specification](https://drive.google.com/drive/folders/1HmGZE9WRSOoGcfonyBvajbgGz6avBs9n)

- *NovaTalks.Core*: K8S readiness/liveness Probe Services [:clipboard: NC2-615] [NC2-615]

	- Developed for Engine, UI endpoints for integration with K8S readiness/liveness Probe Services.
	- Added environment variable **HEALTH_ENABLED** **KEEPALIVE_SERVICES_ENABLED**.

- *NovaTalks.Core*: Added intarvals to historical reports [:clipboard: NC2-657] [NC2-657]

	- To historical reports added one week and one month intarvals.

- *NovaTalks.Core*: Added AZ localization [:clipboard: NC2-669] [NC2-669]

	- In system messages added AZ localization.

- *NovaTalks.Core*: Service for Prometheus Metrics Discovery [:clipboard: NC2-617] [NC2-617]

	- Developed service which issues statistics for Prometeus monitoring.
	- Added environment variable **PROMETHEUS_CLIENT_ENABLED**.
	- Endpoint: **/metrics**.
	- Port: **9100**.

####Bug Fixes

- *NovaTalks.Core*: Fixed incorrect websocket work [:clipboard: NC2-650] [NC2-650]

	- Fixed case when after authorization websocket unsubscribes from invets, and the current socket continues to live in the pending state.

***

###2023R2-1-2 :briefcase: Epic

####New Features

- *NovaTalks.Core*: Conversation substatuses [:clipboard: NC2-546] [NC2-546]

	- On dialog start, agent_bot_id in **active** status for inbox_id = conversation inbox_id is checked.
	- If **agent_bot_id** with status active is available - conversation change status for **pending**.
	- If **agent_bot_id** with status active is'nt available - conversation change status for **open** and substatus for **oninbox**.

	[Substatuses specification](https://drive.google.com/drive/folders/14oP11AIEt-eFGuqaIEA_PNwvqN0231_1)

- *NovaTalks.Core*: Changes in ACD [:clipboard: NC2-548] [NC2-548]

	- For conversations added **subpriority** property (default value = null).
	- In table **conversations** added column **subpriority**.
	- Changed queue allocation mechanism.

	[ACD specification](https://drive.google.com/drive/folders/1ButrDgWeHsF5tSk_4pRIMArvC0MD8zfG)

- *NovaTalks.Core*: Distributed FileStorage [:clipboard: NC2-574] [NC2-574]

	- To export Core data to a CDN compatible with the S3 protocol, the following is done:
	- Tested and brought to working state S3 Storage for Engine (static content storage).
	- Optimizing the speed and efficiency of the internal service Engine FileStorage.
	- Developed a utility for migration of existing Engine data to S3-storage. The utility runs autonomously and work separately from the core (to enable the system engineer to perform the migration at any time).
	
	<details><summary>Added environment variables</summary>
		<p>
		```
		AWS_S3_ACCESS_KEY_ID=dev-01-dev-demo

		AWS_S3_SECRET_ACCESS_KEY=3CSZtPn2ZXtmrseMhU9bzZqjUlwwxJfg

		AWS_S3_BUCKET=dev-01-dev-demo-bucket

		AWS_S3_REGION=us-east-1

		AWS_S3_ENDPOINT=https://minio-ntk-prod-tenant.nsm.novait.local

		```
		</p>
	</details>

[Substatuses specification](https://drive.google.com/drive/folders/15whaUA2R55muBoHmyKsPATgA49Yh2Ojv)


####Bug Fixes

- *NovaTalks.Core*: Fixed incorrect utilization calculation [:clipboard: NC2-599] [NC2-599]

	- To export Core data to a CDN compatible with the S3 protocol, the following is done:

***

##2023R1

###2023R1-6 :briefcase: Epic

####New Features

- *NovaTalks.Core*: Substatus for Agent not ready [:clipboard: NC2-200] [NC2-200]

	- Added 2 system substatuses (**System** - Selected automatically when the agent logs in, **Not responding** - Selected automatically when an agent does not answer an assigned conversation)  for status **busy**
	- Added ability to create/edit custom substatuses.
	- Added new endpoints for substatuses:
		<details><summary>api/v1/accounts/${accountId}:</summary>
		<p>
		```
		Add substatus:                            POST    /substatus

		Update substatus:                         PATCH   /substatus

		Get an Account substatuses:               GET     /substatus
		
		Delete substatus:                         DELETE  /substatus
		```
		</p>
		</details>

[Substatuses specification](https://drive.google.com/drive/folders/15whaUA2R55muBoHmyKsPATgA49Yh2Ojv)

- *NovaTalks.DB*: Substatus for Agent not ready: changes in DB [:clipboard: NC2-283] [NC2-283]

	- Added tables **substatuses**, **user_substatus_events**
	- In table **account_users** added column **substatus_id**

[Substatuses DB specification](https://drive.google.com/drive/folders/18dVlqQLNR_oscxpFouv4XB4S0KZAFuRs)

- *NovaTalks.Core*: Message was read: endpoint [:clipboard: NC2-485] [NC2-485]

	- For **Viber, Facebook, Instagram, WhatsApp Business**, implemented message status support.
	- Available values for statuses "**sent**" (default value), "**delivered**", "**seen**".
	- Only instagram does'nt support **"delivered"** status.
	- Added endpoint for changing status of messages:
		<details><summary>/api/v1/accounts/{accountId}/integrations:</summary>
		Update statu8s of the message:             PATCH    /messages/{messageId}/status
		<p>
		```
		Request body:
		{
			"status": (default value - "sent", available values - "delivered"/"seen")
		}
		```
		</p>
		</details>

	- Added env variables **MESSAGE_ID_PREFIX**=ntid, **MESSAGE_ID_EX_TIME**=604800, **MESSAGE_STATUS_INTERVAL**=5000
	- In table **messages** added new collumn **status**.


	> The this task is unification of tasks:

	> [:clipboard: NC2-486] [NC2-486]

	> [:clipboard: NOV-455] [NOV-455]

- *NovaTalks.Core*: Deleting entities: changes in DB [:clipboard: NC2-344] [NC2-344]

	- In table **users** added column **deleted_at**. Available values: NULL (for active agent), DateTime (for deleted agent).
	- When the agent has been deleted, in tables **inbox_members**, **team_members** all records are deleted with the agent.
	- When the agent has been deleted, in table **conversatoins** where **assignee_id** = agent, **assignee_id** changes to NULL.

	- In table **teams** added column **deleted_at**. Available values: NULL (for active team), DateTime (for deleted team).
	- When the team has been deleted, in table **conversatoins** where **team_id** = team, **team_id** changes to NULL.

	- In table **inboxes** added column **deleted_at**. Available values: NULL (for active inbox), DateTime (for deleted inbox).

	- In table **lables** added column **deleted_at**. Available values: NULL (for active label), DateTime (for deleted label).

	- In table **custom_attribute_definitions** added column **deleted_at**. Available values: NULL (for active attribute), DateTime (for deleted attribute).

[Deleting entities specification](https://drive.google.com/drive/folders/18-3hsNiWW9SC4MHJSI-9nMmGea5Dx1jh)

- *NovaTalks.Core*: Deleting entities: changes in API [:clipboard: NC2-514] [NC2-514]

	- In table **users** added column **deleted_at**. Available values: NULL (for active agent), DateTime (for deleted agent).
	- When the agent has been deleted, in tables **inbox_members**, **team_members** all records are deleted with the agent.
	- When the agent has been deleted, in table **conversatoins** where **assignee_id** = agent, **assignee_id** changes to NULL.

	- In table **teams** added column **deleted_at**. Available values: NULL (for active team), DateTime (for deleted team).
	- When the team has been deleted, in table **conversatoins** where **team_id** = team, **team_id** changes to NULL.

	- In table **inboxes** added column **deleted_at**. Available values: NULL (for active inbox), DateTime (for deleted inbox).

	- In table **lables** added column **deleted_at**. Available values: NULL (for active label), DateTime (for deleted label).

	- In table **custom_attribute_definitions** added column **deleted_at**. Available values: NULL (for active attribute), DateTime (for deleted attribute).

[Deleting entities specification](https://drive.google.com/drive/folders/18-3hsNiWW9SC4MHJSI-9nMmGea5Dx1jh)

- *NovaTalks.Core*: Request phone number/email [:clipboard: NC2-539] [NC2-539]
	- Added 2 system macros **get_phone**, **get_email**
	- After successfully receiving the phone number/email, it is updated in the client's card

[Request phone/email specification](https://drive.google.com/drive/folders/1DiMeRrRM2-mRSp2fjwGgkhcrtI2afjjX)

- *NovaTalks.Core*: Extend report **Messages detail** [:clipboard: NC2-560] [NC2-560]
	- In report **Messages detail** added new collumn **Message status** (which displays the delivery status of the message).

- *NovaTalks.Core*: Improved performance [:clipboard: NC2-562] [NC2-562]
	- Returned  search by **labels** for **dialogs** and **contacts** to the extended filter.

- *NovaTalks.Core*: Substatus for Agent not ready - changes in reports [:clipboard: NC2-575] [NC2-575]
	- In report **Agent aviability detail** added new column **Substatus**.
	- For report **Agent aviability detail** added filter **select substatus**, added a filter for the **substatus** column.
	- In report **Agent status** added new column **Substatus** (required).

[Historical reports specification](https://drive.google.com/drive/folders/1GMh0ky7LWuxMGE8i9j1H_mu9CkM_yNCt)
[Online reports specification](https://drive.google.com/drive/folders/1EOvA8Z8FgbaGIoaFK1AUAWk5R-NwDtPi)

####Bug Fixes

- *NovaTalks.Core*: Fixed problem with system message marking conversation as **seen** [:clipboard: NC2-347] [NC2-347]

***

###2023R1-4 :briefcase: Epic

####New Features

- *NovaTalks.Core*: Import WebHooks from ChatWoot [:clipboard: NC2-479] [NC2-479]

	- Imported Webhooks functionality from the ChatWoot.
	- WebHooks provide user the realtime information about events in the selected account. This funtionality helps to communicate events to the selected apps (like Github or Slack).
	- Added **enable** (true\false) variable for WebHooks.
	- Added **lastTimeFailed** (date) variable - the time of WebHooks failure, after which he will be turned off.

- *NovaTalks.Core*: Macros - Migration from ChatWoot [:clipboard: NC2-522] [NC2-522]

	- Imported macros functionality from the ChatWoot.
	- Admin can create macroses for himself (private) and teams. He can delete macroses which are public and personal.
	- Agent users can create and delete macroses only for themselves.

- *NovaTalks.Core*: Functionality to prohibit exit from NovaTalks in the presence of open assigned dialogs [:clipboard: NC2-512] [NC2-512]

	- Added a mechanism for prohibiting service exit in the presence of open dialogs.
	- This mechanism does not extend to web socket connection.
	- Settings for exiting service will be transmited via web socket and they will be applied immediately.

####Bug Fixes

- *NovaTalks.Core*: Fixed problem when system message mark their conversation as seen [:clipboard: NC2-512] [NC2-512]

***

###2023R1-3 :briefcase: Epic
####New Features
- *NovaTalks.Core*: New Botflow API [:clipboard: NC2-341] [NC2-341]
	- Added new endpoints for botflow:
		<details><summary>api/v1/accounts/${accountId}/integrations:</summary>
		Contact Search:                           GET  /contacts/search
		Add Contact to Inbox:                     POST /contacts/${contactId}/contact_inboxes
		Create Contact:                           POST /contacts
		Conversation Search:                      POST /conversations/filter
		Create Conversation:                      GET  /conversations
		Create Message:                           POST /conversations/${conversationId}/messages
		Toggle Status:                            POST /conversations/${conversationId}/toggle_status
		Assign Conversation:                      POST /conversations/${conversationId}/assignments
		Create or update Conversation Attributes: POST /conversations/${conversationId}/attributes
		Get all Agents:                           GET  /agents
		Get all Teams:                            GET  /teams
		Get Details of Agents in a Team:          GET  /teams/${teamId}/team_members
		Get conversation Chatbot Settings:        GET  /conversations/${conversationId}/chatbot_settings
		```
		</p>
		</details>

- *NovaTalks.Core*: Changes in menu IVR [:clipboard: NC2-480] [NC2-480]

	- Added option to turn off the greeting prompt
	- Added option to turn off the transfer prompt
	- Added buttons support in the widget channel
	- Added buttons support in the instagam channel
	- Removed conversation auto-complete timers for non-working hours
	- Added catch node on all functions where context is requested
	  (in some cases the context can be unavailable)
	- Added throttling on attachments to the default logic

	[Menu IVR specification](https://drive.google.com/drive/folders/1BQyqGtEO8pBMxqJWue15UGbqbpuqRbrh)

- *NovaTalks.Core*: Changed inbox token for all inboxes [:clipboard: NC2-499] [NC2-499]

	- The superadmin token displayed for all inboxes.

####Bug Fixes

***


###2023R1-1 :briefcase: Epic
####New Features

- *NovaTalks.Core*: Historical Reports - Changes in DataBase [:clipboard: NC2-405] [NC2-405]

	Added creation and filling of historical tables according to Historical reports specification:
	
	- **user_team_interval**
	
	- **team_interval**
	
	- **inbox_interval**
	
	- **user_interval**
	
	- **user_csat_interval**

	[Historical reports specification](https://drive.google.com/drive/folders/1GMh0ky7LWuxMGE8i9j1H_mu9CkM_yNCt)

- *NovaTalks.Core*: Historical Reports - API [:clipboard: NC2-354] [NC2-354]

	- Added endpoints for the next methods:
	
	- **Get historical agent overview summary**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/agent_overview_summary</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical team overview summary**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/team_overview_summary</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical inbox overview summary**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/inbox_overview_summary</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical agent availabilit overview summary**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/agent_availability_summary</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical agent CSAT summary**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/agent_csat_summary</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical agent availability detail**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/agent_availability_detail</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical CSAT detail**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/csat_detail</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical dialog detail**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/dialog_detail</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical message detail**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/message_detail</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>

	- **Get historical tag detail**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/tag_detail</summary>
		<p>
		```
		accountId - number (in path) - The numeric ID of the account
		```
		</p>
		</details>


	[Historical reports specification](https://drive.google.com/drive/folders/1GMh0ky7LWuxMGE8i9j1H_mu9CkM_yNCt)

- *NovaTalks.Core*: Data refactoring in reporting_events [:clipboard: NC2-460] [NC2-460] 

	- Relinked the data in the table **reporting_events** to **dialogs** instead of chats.

- *NovaTalks.Core*: Licensing the number of agents [:clipboard: NC2-445] [NC2-445] 

	- Into table **account** added field **users** (This parameter reflects the number of users that the customer can add to the system).

	>  Initial value for field **users**: {"users": 1}.

- *NovaTalks.Core*: Addition of one more counter for Web Socket timeout [:clipboard: NC2-456] [NC2-456] 

	- **AUTH_AGENT_INACTIVE_TIMEOUT** environment variable added (initial value 10000). By which timeout agent status changes to busy.

####Bug Fixes
- *NovaTalks.Core*: Realtime Statistics - reporting_events.conversation_assigned_team [:clipboard: NC2-421] [NC2-421] 

	- Fixed **null** value **user_id** in table **conversation_assigned_team** when team changed.
	- Instead of **null** value field **user_id** has the id of the first agent.

- *NovaTalks.Core*: Wrong value for response_time [:clipboard: NC2-429] [NC2-429] 

	- Fixed wrong calculation of **response_time** in tables **dialogs** and **user_dialogs**.

***

##2022R4
###2023R4-6 :briefcase: Epic
####New Features

- *NovaTalks.Core*: Ported filtration in the Contacts/Conversations section [:clipboard: NC2-135] [NC2-135]

	- Ported the functionality of filtration on fields **Created At**, **Last Activity**, **date**, **list**, **checkbox** in the ***Contacts*** section from version 2.6.0 of chatwoot.

	- Added additional filtration on field **Name** by operators **Contains** and **Does not contain** that is not available in the native chatwoot. 
	
	- Ported the functionality of filtration on fields **Assignee Name**, **Inbox Name**, **Team Name**, **Labels**, **Created At**, **Last Activity** in the ***Conversations*** section from last version of chatwoot.

	[Additional filtration specification](https://docs.google.com/document/d/1DTHXdKdzTt9p6hI3zCWSvKSizWJ43J_0)

- *NovaTalks.Core*: Added new filters to Conversations section [:clipboard: NC2-137] [NC2-137]

	- Added filtration on field **Channel** in ***standart filters*** and on fields **Name**, **Phone Number** in ***Contact Filters***. 

	[Additional filtration specification](https://docs.google.com/document/d/1DTHXdKdzTt9p6hI3zCWSvKSizWJ43J_0)

####Bug Fixes
- *NovaTalks.Core*: Agent does see all conversations without inbox membership [:clipboard: NC2-356] [NC2-356]

	- Fixed agent's ability to see all inbox's conversations without being its member.

	- Fixed agent's ability to see all team's conversations without being its member.

	- Fixed agent's ability to see custom filters related to the teams and inboxes that he is not a member of.

	- Fixed agent's ability to see WebSocket events related to the teams and inboxes that he is not a member of.

	- Fixed agent's ability to direct entry by url to the resources (conversations, conversations filter by inbox conversations filter by team ) that he is not a member of.

- *NovaTalks.Core*: The ACD queue takes the operator in the offline status into the pool [:clipboard: NC2-400] [NC2-400]

	- Fixed getting agent with **offline** status into the queue.
***

###2022R4-5 :briefcase: Epic
####New Features

- *NovaTalks.Core*: Calendars [:clipboard: NC2-372] [NC2-372]

	- Added creation of custom agents' work schedule calendars to use in other functionalities

	- Features:

		- Selecting timezone

		- Setting weekly hours 

		> availability windows for each day of the week

		- Setting exceptions

		> Select calendar day and availability exception hours for it

[Calendars specification](https://drive.google.com/drive/folders/1G8eNbFayR2ZhDkevvUStTElGZxGPOA5S)

- *NovaTalks.Core*: Menu IVR [:clipboard: NC2-334] [NC2-334]

	- Assembly of data based on Chat Bot configuration in NovaTalks

	- Sending data to Nova.Botflow for Message Factory builder

[Menu IVR specification](https://drive.google.com/drive/folders/1BQyqGtEO8pBMxqJWue15UGbqbpuqRbrh)

####Bug Fixes
- none
***

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


[Menu (IVR) specification](https://drive.google.com/drive/folders/1yrgBr7YQ8wh_YuhyDZn6E-RhJZgkqzkv)


[ChatBot specification](https://drive.google.com/drive/folders/1wl5w_mNff59Cdrz0BJfL9iI3zrFnDCjw)

- *NovaTalks.Core.BA*: Historical Reports, Implementation in UI [:clipboard: NC2-190] [NC2-190]

[Historical Reports specification](https://drive.google.com/open?id=13deOqiP48AeBU06GFQpStlYNl5PAXhs3&authuser=cristina.podoliuh%40novait.com.ua&usp=drive_fs)

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
	- Database has been changet according to [Database specification](https://drive.google.com/open?id=1rGq0MR07Uk3GjXWU0CdsxxOc__SZ-ULz&authuser=cristina.podoliuh%40novait.com.ua&usp=drive_fs)

- *NovaTalks.Core*: Cascade removal of custom_attribute in dialog, contact [:clipboard: NC2-338] [NC2-338]

	- In order to delete any custom attribute, it is enough to go to the contact or dialog and delete this attribute.

	- Request to delete attributes, where ${tableName} = 'conversations' or 'contacts' and '${attributeKey}' = custom_attribute key:
``` SQL
	UPDATE ${tableName} 

        SET custom_attributes = custom_attributes - '${attributeKey}' 

        WHERE id IN 

        (SELECT id FROM "public"."${tableName}" WHERE "public"."${tableName}"."custom_attributes" ? '${attributeKey}')

```

- *NovaTalks.Core*: Performance improvement 2 [:clipboard: NC2-335] [NC2-335]

	- Added getting meta information (counters) about the conversations every 3.5 seconds.
	- Added a check for obtaining a user's avatar, there will be no request to obtain it from www.gravatar.com.

- *NovaTalks.Core*: Check Type and Role of Token Endpoint [:clipboard: NC2-383] [NC2-383]

	- GET auth/get_token_info - a new endpoint, returns data about the user by token.

	- NovaTalks In node - token verification has been added on deployment;

	> it must be **ownerType = "User"**, otherwise - show the status (signature under the node).

	- BotAgent In node - similar, but **ownerType = "AgentBot"**.

####Bug Fixes

- *NovaTalks.Core*: Agent does see all conversations without inbox membership [:clipboard: NC2-356] [NC2-356]

	- Fixed agent's ability to see all inbox's conversations without being its member.
	- Fixed agent's ability to see all team's conversations without being its member.
	- Fixed agent's ability to see custom filters related to the teams and inboxes that he is not a member of.
	- Fixed agent's ability to see WebSocket events related to the teams and inboxes that he is not a member of.
	- Fixed agent's ability to direct entry by url to the resources (conversations, conversations filter by inbox conversations filter by team ) that he is not a member of.

- *NovaTalks.Core*: Add validation\limitation when creating and updating custom\additional attributes [:clipboard: NC2-337] [NC2-337]
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
***

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


- *NovaTalks.Core*: Autodistribution MAA - Implementation of the MAA algorithm for Team and Inbox [:clipboard: NC2-260] [NC2-260]

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
	
	- Created endpoint " /auth/active " to receive list of active auth providers

	- Active providers are listed in "cfg.default.json", located in the root of the repository
	
	- **Field format**: 
	
		• "activeProviders": ["email", "genesys", "ldap", "ldaps"]

	> If provider is deleted from the config, the users tied with provider won't be able to log in
	
> Related task [:clipboard: NC2-38] [NC2-38]

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
