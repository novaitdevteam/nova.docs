{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.UI
##Product Notices
***
##2022R3
###2022R3-1-2 :briefcase: Epic
####New Features
- *NovaTalks.UI*: Show password *eye* button [:clipboard: NC2-213] [NC2-213]

	- Button locations:
	
		- *Log In* page
		
		> host/app/login

		- *Profile Settings* menu for admin and for agent

		> host/app/accounts/1/profile/settings

		- Change agent's profile by administrator in *Agents* menu for **New Password** field and **Confirm New Password** field

		> host/app/accounts/1/settings/agents/list -> **Edit** button

####Bug Fixes
- *NovaTalks.UI*: Deleted Contact View button in Contact View [:clipboard: NC2-234] [NC2-234]

	> button direct in the same location

- *NovaTalks.UI*: Fixed Team not being visible without Support agent [:clipboard: NC2-235] [NC2-235]

	> team wouldn't be visible to users if the Support user is not in it 
***

##2022R2
###2022R2-5 :briefcase: Epic
####New Features
- *NovaTalks.UI*: UI upgrade for new WebSocket mechanism [:clipboard: NC2-150] [NC2-150]

	• Migration from **Action** Cable to **WS lib**

	• Authentification mechanism and **keepalive**

- *NovaTalks.UI.BA*: Notifications support in UI [:clipboard: NC2-76] [NC2-76]

[New table with agents' events](./documents/novatalks/NC2-76_Нотифікації_v0.2(NovaTalks).docx.pdf)

####Bug Fixes
- *NovaTalks.UI*: Visual bug fix [:clipboard: NC2-182] [NC2-182]

	- *profile-settings-row* doesn't cover *dropdown-pane dropdown-pane–open*

	- *Delete button* do response in *Conversation filters* if filter has only one value

	- *Edit Contact* side menu do hide (gray out and inactivate) left side bar menus

	- *Keyboard shortcuts (modal-container)* is covered by content

	- In *Edit* menus (all) side bar menus are inactive

	- Importing file with wrong extension or values in *Import Contacts* shows error
	
	- Teams description doesn't go out of workspace bounds
	
	- Changed *New Password* field type to *password*

	- Added *Confirm New Password* to *Edit Agent* menu
	
	- Added *View Contact* button to *contact-info*

***

###2022R2-2 :briefcase: Epic
####New Features
- none

####Bug Fixes
- *NovaTalks.UI*, *NovaTalks.Widget*: UI and Widget improvement [:clipboard: NC2-140] [NC2-140]

	> Changed "**All**" in status filter to "**All statuses**"

	> Added burger button to hide main and support side bars

	> Changed webchat icon on **<i class="fa-regular fa-message"></i>** from [library](https://fontawesome.com/icons/message?s=regular)

###2022R2-1 :briefcase: Epic
####New Features
- *NovaTalks.UI*: Added Ukrainian localization [:clipboard: NC2-113] [NC2-113]

	> ChatWoot Core doesn't support **uk** alocale, therefore, it was made on **de** basis 

- *NovaTalks.UI*: Ukrainian localization translation and correcting [:clipboard: NC2-114] [NC2-114]

####Bug Fixes
- *NovaTalks.UI*: Frontend modification [:clipboard: NC2-109] [NC2-109]

	- **UI**:
	
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

	- **Widget**:

		• fixed unsupported and not sent files from client's side staying at the bottom of the chatting window 

		• added **hide widget**	button

		• deleted **Welcome Messages**

	- **Additional information**:
	
		• BotAgent does work with both widget and messangers (2 different inboxes) at the same time

		• When the same name and email are filled in online chat, the new contact isn't created in BD, but conversation does

		• If the client is in online chat, he will have a green marker at his avatar

- *NovaTalks.UI*: Fixed Ukrainian localization [:clipboard: NC2-119] [NC2-119]

	> localization path: **/app/javascript/dashboard/i18n/locale/uk**

***

##2022R1
###2022R1-6 :briefcase: Epic
####New Features
- *NovaTalks.UI*: 002.001 Auth API - Refactoring Module for Agent Logins (use JWT) [:clipboard: NC2-103] [NC2-103]

	- Static rules: 

		• Admin

		• Supervisor

		• Agent

	> One user (agent) corresponds to one role
	
	> One API method can corresponding to few roles

- *NovaTalks.UI*: Modified chat assignment to an agent [:clipboard: NC2-73] [NC2-73]

	• When agent does resolve the conversation, the team and agent are unssigned from this conversation

	• When agend snooze the conversation, the assignment is preserved

	• When client write a message in **X minutes** after conversation was resolved, the conversation is straightforwardly assigned to that agent
	
	>  X - is a configurable parameter

####Bug Fixes
- *NovaTalks.UI*: Fixed text selection closing submenus [:clipboard: NC2-100] [NC2-100]
***

###2022R1-5 :briefcase: Epic
####New Features
- *NovaTalks.UI*: Migration to ChatWoot v2.2 [:clipboard: NC2-69] [NC2-69]

	- **Deleted from UI**:

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

	- **Added to UI**:

		• Advanced search (filters)

		• Client profile custom fields

		• Contacts: Import CSV 

		• Merge Contacts

		• Email field is now mandatory for agent's creation

####Bug Fixes
- none
***

###2022R1-4 :briefcase: Epic
####New Features
- *NovaTalks.Core*,*NovaTalks.UI*: Possibility analysis for adding new roles [:clipboard: NC2-74] [NC2-74]

	> System has only two roles: Administrator and Agent
	
	> Role matrix is not realized in ChatWoot API

####Bug Fixes
- none
***

###2022R1-3 :briefcase: Epic
####New Features
- none
####Bug Fixes
- *NovaTalks.UI*: Fixed "Private Note" sending duplicate of previous message to a client  [:clipboard: NC2-72] [NC2-72]

***

###2022R1-1 :briefcase: Epic
####New Features
- *NovaTalks.UI*: Set agent's status to offline and logout on exit from workplace [:clipboard: NC2-50] [NC2-50]

	• WebSocket connection is proxed to backend

	• Agent's status is set to *Offline* on exit from workplace
	
	• Added timeout parameter (in seconds):
	
	>  If agent closes\go out of browser tab the websocket won't receive reply from him. If such non-reply time exceeds timeout parameter, the agent's status will switch to *Offline*.
	
	• After login, agent will have *Busy* status

	• Redis integration

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

- *NovaTalks.UI*: UI refining [:clipboard: NC2-61] [NC2-61]

	• **Reports**: hidden CSAT reports
	
	• **Companies**: hidden option
	
	• **Settings**: hidden Integrations and Applications
	
	• **Conversation sidebar**: Team field in now currectly shown in user card and dialog list

	• **User (agent) creation**: user with *email* provider has non-editable uid, which is same as user's email

####Bug Fixes
- none
***

###2021R4
###2021R4-5
####New Features
- *NovaTalks.UI*: UI part for LDAP authentification [:clipboard: NC2-42] [NC2-42] (Related task [:clipboard: NC2-38] [NC2-38])

	• Provider field in "Add Agent" menu with options: "email", "ldap", "ldaps"

	> "genesys" provider added only to users synchronized from Genesys ICWS

- *NovaTalks.UI*: LDAP authentification [:clipboard: NC2-42] [NC2-42]

	- Changed Login payload to:
		```
		{
			password: "Rokdestbob322!!"
			sso_auth_token: ""
			username: "voll@gmail.com"
		}
		```
	- **Authorization flow**:

		1. Sending payload with password and username (mandatory field) on login

		2. On receiving, the backend checks in DB if user exist by **uid** (which is username) field

		3. If **doesn't exist** - failed
		
		3. If **exist** - determine authorization method by **provider** field

		5. Authorization according to choosen method

- *NovaTalks.UI*: User creation with different provider authentification [:clipboard: NC2-44] [NC2-44]

	• Combox in Create Agent menu, with options: Email, Genesys, LDAP, LDAPs

	> "Email" auth gets "User Name" from Email field

	> "Email" auth has "Password" field

	> "Genesys", "LDAP", "LDAPs" auth do not have "Password" field, they synchronize password from their name-self-explanatory sources

- *NovaTalks.UI*: CRUD methods for Agents[:clipboard: NC2-46] [NC2-46]

	• frontend elements (buttons) of *Agents* settings page: create, activate\deactivate, edit, delete agent
	
	• functionality of *Agents* settings page buttons: create, activate\deactivate, edit, delete agent

- *NovaTalks.UI*: Conversation icon visualization as a messanger icon [:clipboard: NC2-47] [NC2-47]

	> Each conversation icon (big and small icons on the left and top sides from the client's nickname respectively) will show the conversation channel according to messanger attribute in *conversation*

- *NovaTalks.UI*: login using UID [:clipboard: NC2-53] [NC2-53]

	> Done for InteractionConnect NovaTalks widget

	• loging in uses *UID* field instead of *email*

	• Genesys auth when auth token exists will send it to a Core istead of login and password

- *NovaTalks.UI*,*NovaTalks.Core*: UI adaptation to work with solitary Engine [:clipboard: NC2-57] [NC2-57]
	
	- **NovaTalks.UI**:

		• login with "Genesys Settings" not checked in.

		> When it is not checked in and it is Genesys auth, then "No Station" option will be choosen by default

		• user Activation\Deactivation 
		
		• provider on Profile and Agents pages
		
		• user editting for administrators

		• administrator creation (all providers, except genesys)

		• agent creation (only with genesys provider)

	- **NovaTalks.Engine**:

		• added provider on agents' synchronization

		• deleted custom attribute {"genesysSync": true} on agents' synchronization

####Bug Fixes
- none
***

###2021R4-4
####New Features

- *NovaTalks.Standalone*: UI [:clipboard: NC2-36] [NC2-36]

	• UI migration to ChatWoot v1.20.0

	• ChatWoot logo changed to NovaIT logo

	• Deleted mentions of versioning

	• Authentification transfered on authentification module

	• Hidden "delete" option in the chat messages options

####Bug Fixes
- none
***

###2021R4-3
####New Features
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

###2021R3
####New Features
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