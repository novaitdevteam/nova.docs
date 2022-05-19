{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks
##Product Notices
***
##2022R2
###2022R2-1 :briefcase: Epic
####New Features
- *NovaTalks.Core*: 001 Application API Migration - Портирование Application Jobs to Bulls MQ [:clipboard: NC2-82] [NC2-82]

For message queue choosen "Bull" Framework - Redis-based queue for Node

- *NovaTalks.UI*: Added Ukrainian localization [:clipboard: NC2-113] [NC2-113]

	ChatWoot Core doesn't support **uk** alocale, therefore, it was made on **de** basis 

- *NovaTalks.ChatWidget*: Conversation widget [:clipboard: NC2-7] [NC2-7]

	Library: [vue-social-sharing] [https://github.com/nicolasbeauvais/vue-social-sharing]

	> Widget is based on [NovaChats] [https://novachats.com]
	
	> • in passive state: round icon with preview of message from agent

	> • on click: shows vertical list of contact channels
	
	> 	• **Web Chat** option opens chat form

	> 	• **Messenger** options opens redirect pages with invite to the chatbot

- *NovaTalks.Sys*: Utilities for Kubernetes configuration [:clipboard: NC2-117] [NC2-117]

- *NovaTalks.Sys*: Multi instance work testing [:clipboard: NC2-108] [NC2-108]

	• two instances were separated in their own acconts
	
	> (convarsations, inboxes, etc. can have the same id in BD)

	• one botflow with a bot for each instance

	> there is a need to put precise resource limit (agents and inboxes) for an instance, or the messages won't be sent to ChatWoot

	• can be one PostgreSQL and Redis for all instances 

- *NovaTalks.Sys*: Docker image for ChatWoot v2.2 [:clipboard: NC2-118] [NC2-118]

	In build the **de** localizations is substituted by **uk** localization (files substitute)

- *NovaTalks.BotAgent*: Conversation auto resolve on inactivity [:clipboard: NC2-115] [NC2-115]
	
	Work algorithm:

	• For every conversation in status **Open** on new incoming message (agent's and client's) set timer tied to Conversation Id in Redis
	
	• (records has prefix: **lastMsg**)
	
	• On key expire the http request will be sent to ChatWoot API to resolve conversation
	
	• (timer lenght can be modified)
	
	> for script to work there is need to add a variable to Redis:
	> 	**redis-cli config set notify-keyspace-events {{value}}**
	> 	where {{value}} is **Kx - prod**, **KEx - dev**
	> which will allow Redis to send Keyspace events on key expire
	> More info [here][https://redis.io/docs/manual/keyspace-notifications/#configuration]

- *NovaTalks.UI*: Ukrainian localization translation and correcting [:clipboard: NC2-114] [NC2-114]

####Bug Fixes
- *NovaTalks.UI*: Frontend modification [:clipboard: NC2-109] [NC2-109]

	UI:
	
	• added to **@ Mentions** tab Beta flag

	• hidden **Ticket close timer** in the Account Setting

	• hidden **Conversation continuity with emails**

	• hidden **Ticket auto resolve by no activity timer**

	• hidden **Email Notifications** in Profile Settings

	• hidden **Personal Signature** in Profile Settings

	• hidden **Enable channel greeting**, **CSAT**, **Business hours** in API Inbox settings

	• hidden **CSAT** in Webchat Inbox settings

	• hidden **Enforce User Indetity Validation** in Webchat Inbox settings
	
	• hidden **Conversation continuity via email** in Webchat Inbox settings

	• changed **Электронная почта** section to "Источник" in Reports in russian locale

	• hidden **Send Message** button in Contacts

	• hidden **Email collect box** from Widget Inbox settings

	• fixed **Custom date range** date subwindow showing

	• fixed agent being unable to **mention** another agent in **Private Notes**

	Widget:

	• fixed unsupported and not sent files from client's side staying at the bottom of the chatting window 

	• added **hide widget**	button

	• deleted **Welcome Messages**

	> Additional information:
	
	> • BotAgent does work with both widget and messangers (2 different inboxes) at the same time

	> • When the same name and email are filled in online chat, the new contact isn't created in BD, but conversation does

	> • If the client is in online chat, he will have a green marker at his avatar

- *NovaTalks.Botflow*: Fixed invalid URI rebooting Botflow [:clipboard: NC2-124] [NC2-124]

<details><summary>List of translated documents</summary>
<p>
```
advancedFilters.json
agentMgmt.json
attributesMgmt.json
automation.json
cannedMgmt.json
chatlist.json
contact.json
contactFilters.json
conversation.json
csatMgmt.json
generalSettings.json
integrationApps.json
integrations.json
labelsMgmt.json
login.json
report.json
resetPassword.json
setNewPassword.json
settings.json
signup.json
teamsSettings.json
webhooks.json
```
</p>
</details>

- *NovaTalks.UI*: Fixed Ukrainian localization [:clipboard: NC2-119] [NC2-119]
***

##2022R1
###2022R1-6 :briefcase: Epic
####New Features
- *NovaTalks.UI*: 002.001 Auth API - Refactoring Module for Agent Logins (use JWT) [:clipboard: NC2-103] [NC2-103]

	> Static rules: 

	> 	• Admin

	> 	• Supervisor

	> 	• Agent

	> One user (agent) corresponds to one role
	
	> One API method can corresponding to few roles

- *NovaTalks.Core*: 002 Application API Migration - Agents [:clipboard: NC2-83] [NC2-83]

	> Agents: 5 methods migrated

- *NovaTalks.Core*: 001 Platform API Migration [:clipboard: NC2-81] [NC2-81]

	> Platform:

	> Accounts: 4 methods, checked

	> AccountUsers: 3 methods, checked

	> AgentBots: 5 methods, migrated

	> Users: 5 methods, checked

- *NovaTalks.DB*: 001 Create TypeORM Migration Procedures [:clipboard: NC2-80] [NC2-80]

- *NovaTalks.Core*: 002.001 Auth API - Refactoring Module for Agent Logins (use JWT) [:clipboard: NC2-102] [NC2-102]

	> Static rules: 

	> 	• Admin

	> 	• Supervisor

	> 	• Agent

	> One user (agent) corresponds to one role
	
	> One API method can corresponding to few roles

- *NovaTalks.Core*: 002.001 Application API New - FileModule [:clipboard: NC2-106] [NC2-106]

	Support of the next file storage methods:

	• **local** - localy save media with sending it by service 
	
	• **S3** - uploading file on **AWS** with sending of cloud link
	
	> local storage (local file system) endpoints:
	
	>	• endpoint **/store** - upload media
	
	>	• endpoint **/store/:id/:filename** - download media

- *NovaTalks.Core*: 002.002 Application API New - ProfileModule [:clipboard: NC2-111] [NC2-111]

	> Method to work with users information (profile module and service to download avatars)

- *NovaTalks.BotAgent*: Team's agents conversation assignment node [:clipboard: NC2-101] [NC2-101]

	• Node has droplist with teams and assignment algorithms
	
	• Node has droplist assignment algorithms

	> hidden **auto assignment** checkoxes from **Team** and **Inbox**
	
	> (default value is "no auto assignment")
	
	> When agent becomes available he is assigned with the conversation from hes Team
	
<details><summary>RAA - Random Available Agent</summary>
<p>
```
1. Search all Team's agents in "Online" status 
2. Assign conversation randomly to one of them
3. If there are no available agents, conversation is assigned to the Team
	(without assignment to the specific agent)
```
</p>
</details>

- *NovaTalks.UI*: Modified chat assignment to an agent [:clipboard: NC2-73] [NC2-73]

	> • When agent does resolve the conversation, the team and agent are unssigned from this conversation

	> • When agend snooze the conversation, the assignment is preserved

	> • When client write a message in **X minutes** after conversation was resolved, the conversation is straightforwardly assigned to that agent
	
	>  (X - is configurable parameter)

- *NovaTalks.BotConnector*: Validated FB (Meta) application testing [:clipboard: NC2-110] [NC2-110]

<details><summary>Connection steps</summary>
<p>
```
• Give administration rights to application on FB (Meta) control page

• Create FB wallpost service:

Example:
curl -X POST  \

 --data "slug=FBPost" \

 --data "appId=1110362119781101" \

 --data "appSecret=b27ba0bc4c817931bf211f8768fcd29b" \

 --data "verifyToken=verifyme" \

 --data "isActivated=true" \

 --data "messengerSupport=true" \

 --data "type=facebookpost" \

"https://novachatsconnector.demo.novait.com.ua/connectors/a1d73235-999e-4401-9cea-978fb008acbd/channels"

messengerSupport will automatically create another channel to work with FB Messenger (how to create only Messenger channel can be found in BotConnector README.md file)

• In service response will be oAuthUrl; When user with administration rights must go through this link to tie application with the FB page

• If the abovementioned step was successful, in mongodb will be written subscribedPages, accessToken and other information

• Without any changes all chats will go to one connector (service url); to redirect to another channel, edit subscribedPages by adding url with link to needed proxy  

```
</p>
</details>

- *NovaTalks.BotFlow*: Presales Demo script improvement [:clipboard: NC2-112] [NC2-112]

• Standard flow (only team transfer)

• Extended flow (with transfer buttons on agents and teams)

	- auto transfer on Team in X minutes after dialog end

	- Team will be the same, if was assigned, before dialog end 

- *NovaTalks.Sys*: Kubernetes on k8s basis based on k3d [:clipboard: NC2-116] [NC2-116]

Main Points:

	• kubernetes

	• k3s Rancher

	• control utilities k8s and k9s

####Bug Fixes
- *NovaTalks.UI*: Fixed text selection closing submenus [:clipboard: NC2-100] [NC2-100]
***

###2022R1-5 :briefcase: Epic
####New Features
- *NovaTalks.Core*,*NovaTalks.BotFlow*: Modification after migration on ChatWoot v2.2.0 [:clipboard: NC2-75] [NC2-75]

	> • Nova.Chats.Engine: override contact deletion method. Event **contact_deleted** will be sent on webhook.

	> • Nova.BotFlow: deletion of **chatWootConversationId** from context for deleted contact on **contact_deleted** event in node **ChatWootConnectorOutNode**.

- *NovaTalks.Core*: Migration to ChatWoot v2.2 [:clipboard: NC2-68] [NC2-68]

- *NovaTalks.UI*: Migration to ChatWoot v2.2 [:clipboard: NC2-69] [NC2-69]

<details><summary>Deleted from UI</summary>
<p>
```
• Company Menu
• Notifications
• In Settings menu:
	1. Integrations
	2. Applications
• In contact profile:
	1. Previous conversations
• In modal window Edit Contact: 
	1. Company Name
	2. Social Profiles
• Mute\Unmute button
• Audio notifications
• Message deletion
```
</p>
</details>


<details><summary>Added to UI</summary>
<p>
```
• Advanced search (filters)

• Client profile custom fields

• Contacts: Import CSV 

• Merge Contacts

• Email field is now mandatory for agent's creation
```
</p>
</details>

####Bug Fixes
- none
***

###2022R1-4 :briefcase: Epic
####New Features
- *NovaTalks.Core*,*NovaTalks.UI*: Possibility analysis for adding new roles [:clipboard: NC2-74] [NC2-74]

	> • System has only two roles: Administrator and Agent
	
	> • Role matrix is not realized in ChatWoot API

####Bug Fixes
- none
***

###2022R1-3 :briefcase: Epic
####New Features
- *NovaTalks.ChatWidget*: Widget code transfer on our Kernel [:clipboard: NC2-63] [NC2-63]

	> • Ported Widget code

	> • Ported SDK

	> • Deleted "Powered By ChatWoot" sign

	> • Optimized Widget bundle
	
	> • New Proxing rules in UI for getting Widget files
	
	>  (envirounment variable "**WIDGET_SOURCE_HOST**"
	
<details><summary>Widget and SDK build info</summary>
<p>
```
Build the SDK
$ yarn build:sdk

Build the Widget
$ yarn build:widget

Folder structure
	•config: 
	webpack config files

	•dist: 
	Contains the built files generated by the scripts (dev package, minified package and map)

	•javascript: 
	Contains an index file that requires all the modules that should be exported and all the source files that compound the package.
	It was copied from https://github.com/chatwoot/chatwoot/tree/v2.1.1/app/javascript

Modified files:
	• javascript/shared/components/Branding.vue

Entry point widget: javascript/packs/widget.js
Entry point sdk: javascript/packs/sdk.js
```
</p>
</details>

####Bug Fixes
- *NovaTalks.UI*: Fixed "Private Note" sending duplicate of previous message to a client  [:clipboard: NC2-72] [NC2-72]

***

###2022R1-2 :briefcase: Epic
####New Features
- *NovaTalks.Core*: Ruby Conversation Routing [:clipboard: NC2-64] [NC2-64]

	> • Which Inbox auto assignment **ON**, assignment on agents goes by **Round Robin** algorithm

	> • Which Team auto assignment **ON**, assignment on agents goes by **Random**

• [Assignment logic link] [https://sd.novait.com.ua/browse/NC2-44 https://github.com/chatwoot/chatwoot/blob/v2.1.1/app/models/concerns/assignment_handler.rb]

• [Sample method link] [https://apidock.com/rails/Array/sample]

####Bug Fixes
- none
***

###2022R1-1 :briefcase: Epic
####New Features
- *NovaTalks.UI*: Set agent's status to offline and logout on exit from workplace [:clipboard: NC2-50] [NC2-50]

	> • WebSocket connection is proxed to backend

	> • Agent's status is set to *Offline* on exit from workplace
	
	> • Added timeout parameter (in seconds):
	
	> 	If agent closes\go out of browser tab the websocoket won't receive reply from him. If such non-reply time exceeds timeout parameter, the agent's status will switch to *Offline*.
	
	> • After login, agent will have *Busy* status

	> • Redis integration

<details><summary>Variables and their default values</summary>
<p>
```
Environment variables:

LOGIN_STATUS='busy'
#status of agent on login
LOGOUT_TIMEOUT_OFFLINE=10000
#websocket connection timeout time

Redis settings:

REDIS_PORT=6379
REDIS_HOST='127.0.0.1'
REDIS_PASSWORD=''
REDIS_USERNAME=''
REDIS_DB=0
REDIS_FAMILY=4,
AGENT_STATE='AgentState::'
#HashMap name for user state storage
ALFRED_ONLINE_STATUS='alfred:ONLINE_STATUS::'
#HashMap name where original ChatWoot store user state

```
</p>
</details>

- *NovaTalks.Core*: Work with *message_updated* events [:clipboard: NC2-60] [NC2-60]

	> Usage of RichMedia will send *POST* request instead of sending *PATCH* request

- *NovaTalks.UI*: UI refining [:clipboard: NC2-61] [NC2-61]

	> **Reports**: hidden CSAT reports
	
	> **Companies**: hidden option
	
	> **Settings**: hidden Integrations and Applications
	
	> **Conversation sidebar**: Team field in now currectly shown in user card and dialog list

	> **User (agent) creation**: user with *email* provider has non-editable uid, which is same as user's email

- *NovaTalks.BotAgent*: chatbot improvement for DEMO [:clipboard: NC2-62] [NC2-62]

	> • Remember the agent who wrote the outbound message (Redis or Memory)
	
	> • When client write a message in X minutes after outbound message from the agent, the conversation is straightforwardly assigned to that agent
	
	>  (X - is configurable parameter)

####Bug Fixes
- none
***

###2021R4
###2021R4-5
####New Features
- *NovaTalks.Core*: LDAP authentification [:clipboard: NC2-38] [NC2-38]

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
	(Genesys ICWS agent Login is saved in "user.uid" which can be used instead of Email in UI)

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

- *NovaTalks.UI*: UI part for LDAP authentification [:clipboard: NC2-42] [NC2-42]
	
	Related task [:clipboard: NC2-38] [NC2-38]

> Provider field in "Add Agent" menu with options: "email", "ldap", "ldaps"

> "genesys" provider added only to users synchronized from Genesys ICWS

- *NovaTalks.Core*: creation of users with different auth providers [:clipboard: NC2-43] [NC2-43]
	
	Related task [:clipboard: NC2-38] [NC2-38]

	> Created endpoint " /auth/active " to receive list of active auth providers

	> Active providers are listed in "cfg.default.json", located in the root of the repository
	
	> field format: 
	
	> • "activeProviders": ["email", "genesys", "ldap", "ldaps"]

	> If provider is deleted from the config, the users tied with provider wont be able to log in

- *NovaTalks.UI*: LDAP authentification [:clipboard: NC2-42] [NC2-42]

	> Changed Login payload to:

	> • password: "Rokdestbob322!!"

	> • sso_auth_token: ""

	> • username: "voll@gmail.com"

<details><summary>Authorization flow</summary>
<p>
```
• 
•
•
•
	1) При логине отправл пейлоад с пассвордом и юзернеймом (обязательные поля)
	2) После получения этого пейлода в бэк идет проверка в БД есть ли такой пользователь по !!!uid = username!!!
	3) Если нет - неуспешна, если есть - по полю "провайдер" определяется метод авторизации 
	4) Авторизация в соотв с методом 
```
</p>
</details>

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

- *NovaTalks.UI*: User creation with different provider authentification [:clipboard: NC2-44] [NC2-44]

	> Combox in Create Agent menu, with options: Email, Genesys, LDAP, LDAPs

	> • "Email" auth gets "User Name" from Email field

	> • "Email" auth has "Password" field

	> • "Genesys", "LDAP", "LDAPs" auth do not have "Password" field, they synchronize password from their name-self-explanatory sources

- *NovaTalks.UI*: CRUD methods for Agents[:clipboard: NC2-46] [NC2-46]

	> • frontend elements (buttons) of *Agents* settings page: create, activate\deactivate, edit, delete agent
	
	> • functionality of *Agents* settings page buttons: create, activate\deactivate, edit, delete agent

- *NovaTalks.UI*: Conversation icon visualization as a messanger icon [:clipboard: NC2-47] [NC2-47]

	> Each conversation icon (big and small icons on the left and top sides from the client's nickname respectively) will show the conversation channel according to messanger attribute in *conversation*

- *NovaTalks.BotAgent*: DEMO chatbot [:clipboard: NC2-51] [NC2-51]

	• Texting chatbot with buttons: greeting, transfer chats on Teams and Agents by ID

	• Supports channels: *Viber*, *Telegram*, *Webchat*

- *NovaTalks.PureConnect.Connector*: Agent's synchronization Genesys to ChatWoot by UID [:clipboard: NC2-52] [NC2-52]

	> • Synchronization fills up *UID* with user's ID

	> • *email* synchronize in corresponding field in *email* table

	> • If *email* is choosen for loging in, it will be used for *UID* field

- *NovaTalks.UI*: login using UID [:clipboard: NC2-53] [NC2-53]

	> Done for InteractionConnect NovaTalks widget

	> • loging in uses *UID* field instead of *email*

	> • Genesys auth when auth token exists will send it to a Core istead of login and password

- *NovaTalks.PureConnect.Connector*: setting chat Id from ChatWoot in Genesys context [:clipboard: NC2-54] [NC2-54]

	> • Additional attribute for conversation: WebTools_nova_conversationId

- *NovaTalks.InteractionConnect*: Sending of Genesys token on login in NovaTalks [:clipboard: NC2-55] [NC2-55]

	> Done for InteractionConnect NovaTalks widget

	> • Catching of temporary token on login session start

	> • Reaction on conversation change in InteractionConnect

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
	
<details><summary>Changes</summary>
<p>
```
NovaTalks.UI:

1. login with "Genesys Settings" not checked in.
	When it is not checked in and it is Genesys auth, then "No Station" option will be choosen by default
2. user Activation\Deactivation 
3. provider on Profile and Agents pages
4. user edditing for administrators
5. administrator creation (all providers, except genesys)
6. agent creation (only with genesys provider)

NovaTalks.Engine:

1. added provider on agents' synchronization
2. deleted custom attribute {"genesysSync": true} on agents' synchronization
```
</p>
</details>

####Bug Fixes
- none
***

###2021R4-4
####New Features

- *NovaTalks.Standalone*: UI [:clipboard: NC2-36] [NC2-36]

	> • UI migration to ChatWoot v1.20.0

	> • ChatWoot logo changed to NovaIT logo

	> • Deleted mentions of versioning

	> • Authentification transfered on authentification module

	> • Hidden "delete" option in the chat messages options

####Bug Fixes
- none
***

###2021R4-3
####New Features
- *NovaTalks.ChatProxy*: ChatProxy :material-arrow-right: ChatWoot connector [:clipboard: NC2-26] [NC2-26]

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

- *NovaTalks.Core*: CRUD methods for Agents [:clipboard: NC2-34] [NC2-34]

	• All methods require *api_access_token*, that can be took from super administrator
	
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
  (no relation to roles, only on "NovaTalks.sync": "true" attribute value) 

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

	> Users in genesys must have Custom Attribute "NovaTalks.sync" with value "true"

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

*Contact card:*

• Deleted: **Assign Agent**, **Assign Team**
• Email now is non-editable
• Deleted: **Social Profiles**, **Company Name**

*Conversations tab:*

• Deleted tabs: **Unassigned**, **All**
• Now status filters only have Open and Resolved
• **Resolve** button is inactive if conversation has **Resolved** status
• Deleted: "..." button (conversation settings)

*Setting tab:*

• Not acessible to agents

*Login page:*

• Deleted: **Create New Account** with the **signupEnabled** option in config


- *NovaTalks.Core*: Outbound messages from BotFlow, BotConnector [:clipboard: NC2-16] [NC2-16]

- *NovaTalks.Genesys.PureConnect.Connector*: Core development for outbound messages [:clipboard: NC2-21] [NC2-21]

*ChatProxy:*

• in config cunfigured sending of variable **nova_chatid** with value **{chatid}**

• in config sending of variables **nova_userid** with value **{userid}**

• in config sending of variables **nova_source** with value **{source}**

*Nova.PureConnect.Connector:*

• receiving **nova_chatid** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

• receiving **nova_userid** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

• receiving **nova_source** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

Limitation: one contact for one channel

All client's interactions in one channel are stored in one conversation

Conversations are linked by **nova_chatid**, **nova_userid**, **nova_source**

- *Nova.Chats*: UI extension [:clipboard: NC2-23] [NC2-23]

*Contact Card:*

• Icon: shows user's avatar 

• Icon: if user's avatar is not available, shows messanger icon by it's type stored in Conversation's attributes

> Channel name (source) extracted from field: **additionalAttributes.contactSource**

> Icons are stored in ./assets/dashboard/images/channels

*Contact Card - contact header:*

• Mini icon: shows messanger icon by it's type stored in Conversation's attributes

> Icons are stored in ./assets/dashboard/images/channels

• Mini title: prints messanger name from it's type stored in Conversation's attributes

> Channel name (source) extracted from field: **additionalAttributes.contactSource**

*Conversations tab:*

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