{%
   include-markdown "./links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.Voice
##Product Notices
***

##2023R4

###2023R4-2 :briefcase: Epic

#New Features

***
<h3><p style="text-align: center;">CORE</p></h3>

- *NovaTalks.Core*: Changes in queues [:clipboard: NC2-884] [NC2-884]

	- When selecting an operator, it is checked whether their phone is registered (in the database, table "users", field "station") - only for conversation_type=call.

[Specification](https://docs.google.com/document/d/1gsrmfZCcwkUXZvNZboki6SPFvmO1zO6S/edit#heading=h.ihv636)

***
<h3><p style="text-align: center;">UI</p></h3>

- *NovaTalks.UI*: Added new channel type "Call" in Inboxes [:clipboard: NC2-719] [NC2-719]
 			
	Incoming and outgoing calls were added.

	- Added Call control panel:
		
		- Call time - displays the time from the moment the agent accepts the conversation until it ends
		- Hold - puts the other party on hold
		- Mute - mute the agent's microphone during a call
		- Blind Transfer - direct call forwarding to another number, another user or team
		- Consult Transfer - enables agents to transfer the conversation between two participants for advice or additional assistance
		- Resolve - ends the call
		
	- Added display buttons in the conversation "Reject" and "Accept" the call.
	
	- Added setting up the call control panel can be set in Account Settings - Conversations section.	
	
	- Added the "call_conrol_pannel" column to the "accounts" table.
 
[Specification](https://docs.google.com/document/d/1NQ4R5IXyLWVScGEqEwEfSOiq7Rycnp6L/edit?rtpof=true)
	
- *NovaTalks.UI*: Added new functional WebRTC phone [:clipboard: NC2-787] [NC2-787]

	- Added the ability to accept and reject incoming voice calls.

		- Added "Sign in to account" page which after authorization contains: 
	 
			- Main "Dialpad" for calls
		 
			- Main page Call History
			
			- Main Profile Settings
		
	- Added recording of phone calls.

[Specification](https://drive.google.com/open?id=1WNOHCaHtjkwwL6SteEh0c_BQpt1ct1VX&usp=drive_fs)

- *NovaTalks.UI*: Dashboard apps: changes in UI [:clipboard: NC2-788] [NC2-788]

	> Settings -> Integrations -> Dashboard Apps -> "Add a new dashboard app"

	
	- Added button "Add additional params" with "additional params key" and "additional params value" fields for integration WebRTC. 
		
	> Conversations -> Dashboard Apps sidebar:

	
	- Added the App update button (When you click the button, the application should reload without completely reloading the main Novatalks page).
		
[Specification](https://docs.google.com/document/d/1UAfer-4JrdOFXzUnk0SjFuE8T9BjXBR7/edit)

#Bug Fixes

- none

***



##2023R4

###2023R4-1 :briefcase: Epic

#New Features

***
<h3><p style="text-align: center;">CORE</p></h3>

- *NovaTalks.Core*: Added Telephony authentication [:clipboard: NC2-640] [NC2-640]
  
	- Added extension API for agents:
	
		- Login and password for phone registration
		
		- ENV Variable: SIP_DOMAIN
	
		- Login and password verification

- *NovaTalks.Core*: Added extension API for Inbox [:clipboard: NC2-638] [NC2-638]
 
	- Added Queue-events proxying support
	
	- Added Client-events support for the scenario, when a client/agent disconnects during a call

- *NovaTalks.Core*: Added implementation of the queue and additional schemes for auto-distribution of dialogues [:clipboard: NC2-663] [NC2-663]	

	[Specification](https://drive.google.com/drive/folders/1ButrDgWeHsF5tSk_4pRIMArvC0MD8zfG)


***
<h3><p style="text-align: center;">UI</p></h3>

- *NovaTalks.UI*: Added the functionality to initiate communication with a new client first [:clipboard: NC2-720] [NC2-720]

	> **Administrator**: When creating a new "API Channel" in the "Inboxes" settings, the administrator selects the "Can write first to a new client" checkbox and selects the "Channel for writing first to a new client" drop-down list.
	
	> **Agent**: The agent, when contacting first, selects Contacts and selects an existing contact or creates a new one. Then clicks on the "Write first to a new client" button.
	
	[Specification](https://docs.google.com/document/d/1NcQZqrq8FX1iAVo0MsX2bddXGB4hj3UW/edit)

- *NovaTalks.UI*: Added the Recording functionality [:clipboard: NC2-729] [NC2-729]

	Added player for recording and listening in dialogue sections in an open conversation.

	[Specification](https://drive.google.com/drive/folders/19f6HWRfB3AsmiGRlWHCc-8t5yNug6qFI)
	
- *NovaTalks.UI*: Added changes in Inboxes for new channel type "Call" [:clipboard: NC2-662] [NC2-662]

	- Changes in UI: Added new parameters (Conversation Type, Auto Assignment Limit) in the Inbox settings.
	
	- Changes in database: Added the "conversation_type" and "auto_assignment_limit" parameters to "additional_settings" in the "Inboxes" table.

	[Specification](https://docs.google.com/document/d/1QrVX0PZ0sv-CAow1GlNMrIEFWTwUCeQT/edit#heading=h.3znysh7)
	
- *NovaTalks.UI*: Added changes in Teams for new channel type "Call" [:clipboard: NC2-661] [NC2-661]

	- Changes in UI:
		
		- Added the section "Set up Сonversion types" when creating a new Teams. "Set up Сonversion types" include page "Chat" with parameters: 
			
			- Utilization (%)
			- Use Inbox Settings for Utilization (%)
			- Auto Assignment Limit
			- Use Inbox Settings for Auto Assignment Limit
			- Auto Answer
			- Use Inbox Settings for Auto Answer
			- Alerting timeout (sec)
			- Use Inbox Settings for Alerting timeout (sec)
		
		- Changes the section "Add agents" when creating a new Teams:
		
			- Added gray color for the table header
			- Added list sorting (the default agent field: A-Z)
			- Added filters by columns
		
		- Changes in the "Settings" section when editing a Team:
		
			- Added display of the Team name
			- Added page "Settings" with parameters (Team name, Team Description, Allow ACD for this Team, assignment algorithm)  
			- Added page "Collaborators" with the list of agents for Team (the same as when creating a Team) 

	- Changes in database:
	
		- Added the "conversation_type" and "auto_assignment_limit" parameters to "additional_settings" in the "Inboxes" table.
		
		- Added the "utilization" parameters for each Conversation Type (chat, social_media, email, call) to "additional_settings" in the "Team" table.
		
		- Added the "use_inbox_settings_utilization" parameters for each Conversation Type (chat, social_media, email, call) to "additional_settings" in the "Team" table.
		
		- Added the "auto_assignment_limit" parameters for each Conversation Type (chat, social_media, email, call) to "additional_settings" in the "Team" table.
		
		- Added the "use_inbox_settings_aal" parameters for each Conversation Type (chat, social_media, email, call) to "additional_settings" in the "Team" table.
		
	[Specification](https://docs.google.com/document/d/1QrVX0PZ0sv-CAow1GlNMrIEFWTwUCeQT/edit#heading=h.3znysh7)


***
<h3><p style="text-align: center;">BOTFLOW</p></h3>

- *NovaTalks.BotFlow*: Added the Jambonz node to NodeRed for Call channel [:clipboard: NC2-642] [NC2-642]

- *NovaTalks.BotFlow*: Added transferring data on a call from BotFlow to NovaTalks [:clipboard: NC2-748] [NC2-748]

	[Specification](https://docs.google.com/document/d/1A47PyGnAgzl3VM2JV12uCnhH28WtKpzM/edit)

#Bug Fixes

- none

***