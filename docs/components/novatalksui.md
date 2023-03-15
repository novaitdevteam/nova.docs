{%
   include-markdown "./links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.UI
##Product Notices
***

##2023R1

###2023R1-4 :briefcase: Epic

####New Features

- *NovaTalks.UI*: Mechanism for prohibiting service exit in the presence of open dialogs [:clipboard: NC2-512] [NC2-512]

	- Added a mechanism for prohibiting service exit in the presence of open dialogs.
	- This mechanism does not extend to web socket connection.
	- Settings for exiting service will be transmited via web socket and they will be applied immediately.

- *NovaTalks.UI*: Macros - Migration from ChatWoot [:clipboard: NC2-418] [NC2-418]

	- Imported macros functionality from ChatWoot.
	- Admin can create macros for himself (private) and teams. He can delete common macros (those available to everyone and personal).
	- User can create and delete macros only for himself.

- *NovaTalks.UI*: Import WebHooks from ChatWoot [:clipboard: NC2-522] [NC2-522]

	- Imported Webhooks functionality from ChatWoot.
	- WebHooks provide user the realtime information about events in selected account. This funtionality helps to communicate events to selected apps like Github or Slack.
	- Added **enable** (true\false) variable for WebHooks.
	- Added **lastTimeFailed** (date) variable - the time of WebHooks failure, after which he will be turned off.

####Bug Fixes

- *NovaTalks.UI*: Validation for custom\additional attributes [:clipboard: NC2-419] [NC2-419]

	- Added validation on custom\additional attributes in contacts and conversations.
	- Additional attributes fields in the conversations: **botId**, **chatId**, **contactSource**.
	- Added validation on custom\additional attributes in contacts and conversations, and added validation on **content_attributes** in **messages**.
	- For custom\additional attributes there are a string limit of 255 characters and array of 1024 bytes.
	- For content_attributes there are a string limit of 255 characters and array of 2048 bytes (the array can hold buttons).
	- These values ​​can be changed in the Attributes decorator or not added at all (for developers).

- *NovaTalks.UI*: Fixed request for Tags Detail [:clipboard: NC2-491] [NC2-491]

	
	- **Changed request for Tags Detail**
		<details><summary>GET /api/v2/accounts/{accountId}/historical/tag_detail</summary>
		<p>
		```
		correct request:
		/api/v2/accounts/1/historical/tag_detail?tags=*it-tv*&since=1674511200&until=1674597542

		incorrect request:
		/api/v2/accounts/1/historical/tag_detail?since=1674511200&until=1674597542&*tags[]=1*
		```
		</p>
		</details>

- *NovaTalks.UI*: Bugs - Historical reports [:clipboard: NC2-497] [NC2-497]

	- Fixed importing **json** format value to **csv** file.
	- Added **DateTime** format to **timestamp** instead of seconds only.
	- Fixed: **Dialog ID**, **Sender type**, **Sender name**, **Sender Id**, **Agent assigned**, **Team assigned** - **ASC\DESC** filter doesn't work.
	- Added reseting of filters after reports start.
	- Added validation for input value in page selection field. NaN value value is not processed.
	- In this task has been fixed [:clipboard: NC2-520] [NC2-520] (fixed spliting columns and data in reports).

- *NovaTalks.UI*: Sending text wit "/" symbols [:clipboard: NC2-497] [NC2-497]

	- Fixed sending text with the "/" symbols.
	- Input field does'nt react on "/" symbol, without choosing canned response.

***

###2023R1-3 :briefcase: Epic

####New Features

- *NovaTalks.UI*: Changes in menu IVR [:clipboard: NC2-480] [NC2-480]

	- Added turning off greeting prompt.
	- Added turning off transfer prompt.
	- Added buttons in widget.
	- Added buttons in instagam.
	- Removed conversation auto-complete timers for non-working hours.
	- Added catch node where where context is requesting.
	- Added throttling to the default logic on attachments.

	[Menu IVR specification](https://drive.google.com/drive/folders/1BQyqGtEO8pBMxqJWue15UGbqbpuqRbrh)

- *NovaTalks.UI*: Disable text formatting [:clipboard: NC2-379] [NC2-379]

	- Disabled text formatting in the input field.

####Bug Fixes
- *NovaTalks.UI*: Bugs fixed [:clipboard: NC2-261] [NC2-261]

	- UI adapted for different scaling.
	- Canned Responce is added to the previously entered text.
	- Corrected distance between name and email in contact filter.
	- Fixed placing description text on labels table, when zoom in.
	- Fixed the "select" color in the conversation filter.
	- Fixed Translation of system messages for ua and ru localizations. 

***

###2023R1-1 :briefcase: Epic
####New Features

- *NovaTalks.UI*: Review of dependencies [:clipboard: NC2-331] [NC2-331]
(Related tasks:
- [:clipboard: NC2-433] [NC2-433]
- [:clipboard: NC2-454] [NC2-454]
- [:clipboard: NC2-451] [NC2-451]
- [:clipboard: NC2-452] [NC2-452]
- [:clipboard: NC2-453] [NC2-453]
- [:clipboard: NC2-240] [NC2-240])
	- Cleared and updated all dependencies.
	- Added husky.
	- Updated Eslint rules.
	- Added commitlint.

- *NovaTalks.UI*: Historical Reports - API [:clipboard: NC2-354] [NC2-354]

	- Added endpoints for next methods:
	
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

- *NovaTalks.UI*: Transfer of language selection [:clipboard: NC2-454] [NC2-454]

	- Language selection has been transferred to profile settings.

- *NovaTalks.UI*: Timezone settings [:clipboard: NC2-433] [NC2-433]

	- Added timezone settings.

	[Timezone specification](https://drive.google.com/drive/folders/1GRLkT1LR4UBlDEEG-Hro6sRmdZ5zu4e7)

- *NovaTalks.UI*: Transfer of settings [:clipboard: NC2-453] [NC2-453]

	- Settings transferred from Organization Settings to Account Settings:
	- **Notifications**
	- **Account Name**
	- **Site language**
	- **Select timezone**

- *NovaTalks.UI*: Refactoring of User Data [:clipboard: NC2-240] [NC2-240]

	- Array of accounts from User Data has been removed

####Bug Fixes

- *NovaTalks.UI*: Incorrect dialog's filter [:clipboard: NC2-466] [NC2-466]

	- Fixed dialogs filtration by **equal_to** in **additional_atteibutes**.

- *NovaTalks.UI*: Incorrect calculating of time in calendars [:clipboard: NC2-451] [NC2-451]

	- Fixed incorrect calculating of time in **calendars**.
	- Added time max value **23:59** instead of **00:00**

- *NovaTalks.UI*: Fixed iтзге ашудв [:clipboard: NC2-452] [NC2-452]

	- Fixed the expand of the input field when entering large text.

***

##2022R4
###2023R4-6 :briefcase: Epic
####New Features

- *NovaTalks.UI*: Ported filtration in the Contacts/Conversations section [:clipboard: NC2-285] [NC2-285]

	- Ported the functionality of filtration on fields **Created At**, **Last Activity**, **date**, **list**, **checkbox** in the ***Contacts*** section from version 2.6.0 of chatwoot.

	- Added additional filtration on field **Name** by operators **Contains** and **Does not contain** that is not available in the native chatwoot. 

	- Ported the functionality of filtration on fields **Assignee Name**, **Inbox Name**, **Team Name**, **Labels**, **Created At**, **Last Activity** in the ***Conversations*** section from last version of chatwoot.

	[Additional filtration specification](https://docs.google.com/document/d/1DTHXdKdzTt9p6hI3zCWSvKSizWJ43J_0)

- *NovaTalks.UI*: Added new filters to Conversations section [:clipboard: NC2-287] [NC2-287]

	- Added filtration on field **Channel** in ***standart filters*** and on fields **Name**, **Phone Number** in ***Contact Filters***. 

	[Additional filtration specification](https://docs.google.com/document/d/1DTHXdKdzTt9p6hI3zCWSvKSizWJ43J_0)

- *NovaTalks.UI*: Added dialog search by contact tag in filter [:clipboard: NC2-217] [NC2-217]

	- Added filtration on field **tag** in the ***Conversations*** section. 

- *NovaTalks.UI*: Migration to NodeJS v18 (LTS) [:clipboard: NC2-428] [NC2-428]

	- Updated **node.js -> 18.12.1** 

- *NovaTalks.UI*: Localization update [:clipboard: NC2-365] [NC2-365]

	- Updated localization for NovaTalks User Interface.

####Bug Fixes

- *NovaTalks.UI*: Incorrect behavior of the filter when searching by date [:clipboard: NC2-412] [NC2-412]

	- The date format in the filter/search requests and responses are reduced to the same format (**DD/MM/YYYY**). 

- *NovaTalks.UI*: Incorrect calculation of time in the calendar [:clipboard: NC2-451] [NC2-451]

	- Fixed an error in which the time was counted in negative values.

	- Added time range **xx - 23:59** instead of **xx - 00:00**. 

- *NovaTalks.UI*: Fixed input field for long text [:clipboard: NC2-452] [NC2-452]

	- Added dynamic text input field instead of static. 

- *NovaTalks.UI*: Incorrect work of Custom Filters [:clipboard: NC2-224] [NC2-224]

	- Fixed ability to specify **equals** and **not equals** labels in the filter by the same attribute.

	- Added possibility to select **none** value in **filter -> assignee name**.

	- Fixed filter behavior when search with **Not Equal: value** tag did not return results with **value = null**.

- *NovaTalks.Core*: Agent does see all conversations without inbox membership [:clipboard: NC2-356] [NC2-356]

	- Fixed agent's ability to see all inbox's conversations without being its member.

	- Fixed agent's ability to see all team's conversations without being its member.

	- Fixed agent's ability to see custom filters related to the teams and inboxes that he is not a member of.

	- Fixed agent's ability to see WebSocket events related to the teams and inboxes that he is not a member of.

	- Fixed agent's ability to direct entry by url to the resources (conversations, conversations filter by inbox conversations filter by team ) that he is not a member of.

***

###2022R4-5 :briefcase: Epic
####New Features

- *NovaTalks.UI*: Calendars [:clipboard: NC2-372] [NC2-372]

	- Added creation of custom agents' work schedule calendars to use in other functionalities

	- Features:

		- Selecting timezone

		- Setting weekly hours 

		> availability windows for each day of the week

		- Setting exceptions

		> Select calendar day and availability exception hours for it

[Calendars specification](https://drive.google.com/drive/folders/1G8eNbFayR2ZhDkevvUStTElGZxGPOA5S)

- *NovaTalks.UI*: Hidden **Offline** status change option [:clipboard: NC2-432] [NC2-432]

	- Hidden **offline** status for Agent and Administrators in UI
	- The system assigns an offline status to the agent when the websocket connection is interrupted for 10 minutes or when agent has logged out

- *NovaTalks.UI*: Menu IVR [:clipboard: NC2-369] [NC2-369]

	- Assembly of data based on Chat Bot configuration in NovaTalks

	- Sending data to Nova.Botflow for Message Factory builder

[Menu IVR specification](https://drive.google.com/drive/folders/1BQyqGtEO8pBMxqJWue15UGbqbpuqRbrh)

####Bug Fixes
- none

***
###2022R4-1-2-3-4 :briefcase: Epic
####New Features

- *NovaTalks.UI*: Historical reports, Implementation in UI [:clipboard: NC2-352] [NC2-352]

	- Implemented historical reports in UI

[Historical reports specification](https://drive.google.com/drive/folders/1GMh0ky7LWuxMGE8i9j1H_mu9CkM_yNCt)

- *NovaTalks.UI*: Performance improvement 2 [:clipboard: NC2-335] [NC2-335]

	- Added getting meta information (counters) about the conversations every 3.5 seconds.
	- Added a check for obtaining a user's avatar, there will be no request to obtain it from www.gravatar.com.

- *NovaTalks.UI*: Localization update [:clipboard: NC2-365] [NC2-365]

	- Updated localization for NovaTalks User Interface.

####Bug Fixes
- *NovaTalks.UI*: Fixed agent ability to see all conversations without inbox membership [:clipboard: NC2-356] [NC2-356]

	- The agent now cannot see all inbox dialogues/custom filters without being a member of corresponding inbox.
***

##2022R3
###2022R3-6 :briefcase: Epic 
####New Features
- *NovaTalks.UI*: Draft saving for messages and private notes [:clipboard: NC2-320] [NC2-320]

	> Draft saving for agent's messages and private notes when he travels between menus\conversations
	
	> Will reset on page refresh

- *NovaTalks.UI*: Adding messengers to select on the widget [:clipboard: NC2-348] [NC2-348]

	> Added additional parameters to the widget configuration section for selecting messengers, namely Instagram, Line.

	> Updated the script for the widget.

- *NovaTalks.UI*: MAA - autoassignment method with Team and Inbox utilization [:clipboard: NC2-262] [NC2-262]

> Check utilization on agent (identification by **access_token**):

<details><summary>POST /api/v1/accounts/{accountId}/conversations/pool</summary>
<p>
```
[
  {}
]
```
</p>
</details>
	
> Check utilization distribution:

<details><summary>POST /api/v1/accounts/{accountId}/conversations/queue</summary>
<p>
```
[
]
```
</p>
</details>

[Additional chats autoassigment schematics - Queues](https://drive.google.com/drive/folders/1vEhGK7vabQL-n7c5CtolEJ74_s3I_wZg)

####Bug Fixes
- none

***

###2022R3-5 :briefcase: Epic
####New Features
- *NovaTalks.UI*: Write first to the client (WhatsApp Business) - changes to the contact form [:clipboard: NC2-138] [NC2-138]

	- Changes to fields in Contacts list table
	
	> deleted rudamental fields: **Company, City, Country**

	> added **Last Activity** field
	
	> added **Conversations** counter field

	- Changes on the Contact Details page
	
	> added **Conversations** submenu to the side bar with direct linking to the conversation

[Write first outbound messaging WhatApp Business](https://drive.google.com/drive/folders/1w2KQLIZM-3ovi4G2MBrHqX0_A_A85oiu)

- *NovaTalks.UI*: Write first to the client (WhatsApp Business) [:clipboard: NC2-257] [NC2-257]

	- Added transport channel pictures for WhatsApp WEB and WhatsApp Business

	- Default transport and bot config in *chatbot-chatwoot-connector-out* node 

	> Default transport and bot config are needed for create message structure if botId was not provided

	- Implemented *Can write first* function to the inbox entity

	> Ability to write outbound message to WhatsApp channel number with creation of new conversation under this contact

<details><summary>POST /api/v1/accounts/{accountId}/conversations/send_outbound_messages</summary>
<p>
``` json
{
  "inbox_id": 1,
  "contact_id": 1,
  "additional_attributes": {
    "botId": "aab9c9a92923c5b2",
    "chatId": 43220521,
    "contactSource": "telegram"
  },
  "message": {
    "content": "hello"
  },
  "contact": {
    "phoneNumber": "+1234"
  }
}
```
</p>
</details>

<details><summary>"additional_settings" - addition to Inbox requests </summary>
<p>
``` json
{
"additional_settings":
	{
		"can_write_first_to_a_new_client": true,
		"channel_for_writing_first_to_a_new_client": "string"
	}
}
```
</p>
</details>

[Write first outbound messaging WhatApp Business](https://drive.google.com/drive/folders/1w2KQLIZM-3ovi4G2MBrHqX0_A_A85oiu)

- *NovaTalks.UI*: Labels visualization in conversation previews [:clipboard: NC2-323] [NC2-323]

> tags placing is adaptive to their length and will transfer to the new line if there are not enough place 

- *NovaTalks.UI*: Post Call Survey - part 1 [:clipboard: NC2-226] [NC2-226]

> CSAT can be enabled in the Inbox settings

	- CSAT functionality implemented as a Nova.Botflow scenario
	
	- CSAT scenario, by standard, is started when conversation changes status to **Resolved** 

<details><summary>GET /api/v1/accounts/{accountId}/csat</summary>
<p>
``` json

```
</p>
</details>

<details><summary>POST /api/v1/accounts/{accountId}/csat</summary>
<p>
``` json
{
  "contact_id": 1,
  "conversation_id": 1,
  "message_id": 1,
  "rating": 1
}
```
</p>
</details>

<details><summary>GET /api/v1/accounts/{accountId}/csat/{csatId}</summary>
<p>
``` json

```
</p>
</details>

<details><summary>PATCH /api/v1/accounts/{accountId}/csat/{csatId}</summary>
<p>
``` json
{
  "rating": 1
}
```
</p>
</details>

[Post Call Survey - specification for part 1](https://drive.google.com/drive/folders/1v8A5g681VFrooYz_mXkF2cH2BSENxIp_)

- *NovaTalks.UI*: Notifications [:clipboard: NC2-198] [NC2-198]

> Global settings do not require rights check (API, in UI only admin users have this option)

> Help section is on the right side description and is highlighted on hovering over the option

<details><summary>POST /api/v1/notification_subscriptions</summary>
<p>
``` json
{
"additional_settings":
	{
		"can_write_first_to_a_new_client": true,
		"channel_for_writing_first_to_a_new_client": "string"
	}
}
```
</p>
</details>

<details><summary>GET/PATCH /api/v1/accounts/{accountId}/notification_settings/global</summary>
<p>
``` json
{
  "notification_settings": {
    "selected_notification_setting_flags": [
      "conversation_creation_sound",
      "conversation_assignment_pop_up",
      "conversation_mention_blink"
    ],
    "selected_creation_sound": "creation.mp3",
    "selected_assignment_sound": "assignment.mp3",
    "selected_new_message_sound": "new_message.mp3",
    "selected_mention_sound": "mention.mp3"
  }
}
```
</p>
</details>

<details><summary>GET/PATCH /api/v1/accounts/{accountId}/notification_settings</summary>
<p>
``` json
{
  "notification_settings": {
    "selected_notification_setting_flags": [
      "conversation_creation_sound",
      "conversation_assignment_pop_up",
      "conversation_mention_blink"
    ],
    "selected_creation_sound": "creation.mp3",
    "selected_assignment_sound": "assignment.mp3",
    "selected_new_message_sound": "new_message.mp3",
    "selected_mention_sound": "mention.mp3"
  }
}
```
</p>
</details>

<details><summary>GET /api/v1/accounts/{accountId}/notifications/unread_count</summary>
<p>
``` json
{
	integer
}
```
</p>
</details>

<details><summary>POST /api/v1/accounts/{accountId}/notifications/read_all</summary>
<p>
``` json
{
  "id": 1,
  "account_id": 1,
  "user_id": 1,
  "all_notification_setting_flags": [],
  "selected_notification_setting_flags": [],
  "selected_creation_sound": "creation.mp3",
  "selected_assignment_sound": "assignment.mp3",
  "selected_new_message_sound": "new_message.mp3",
  "selected_mention_sound": "mention.mp3"
}
```
</p>
</details>

[Notifications functionality specification](https://drive.google.com/drive/folders/1rU0RPuJ_wzQaDuXy6bsLxDKMB28RW3hb)

- *NovaTalks.UI*: Hide snoozed status menu [:clipboard: NC2-239] [NC2-239]

> Snoozed functionality, in overall, does conflict with Core and Botflow additions

- *NovaTalks.UI.BA*: Outbound message in resolved conversation [:clipboard: NC2-157] [NC2-157]

> When agent will write in the resolved conversation, the conversation will be assigned to him and set in status "Open"

[Outbound message in resolved conversation specification](https://drive.google.com/drive/folders/1uA86aUE0VP8zU-4vwjvRW3fYAdAzX8mN)

####Bug Fixes
- *NovaTalks.UI*: Fixed agent name visualization in conversarsation channels using wrong field [:clipboard: NC2-327] [NC2-327]

- *NovaTalks.UI, Core*: Fixed problem when page refresh mark all conversations as seen [:clipboard: NC2-296] [NC2-296]

- *NovaTalks.UI*: Fixed wrong chat counter visualization[:clipboard: NC2-294] [NC2-294]

	- On high loads every new conversation or status change of existing conversation initiated counter change which in return caused chaotic counter values visualization
	
	- For route **/conversations/meta** stated ratelimit (throttling) with **avarage** and **burst** parameters

- *NovaTalks.UI*: Fixed assignee and team visualization [:clipboard: NC2-295] [NC2-295]

> On trasfer, the agent and team visualized in UI on page refresh

***

###2022R3-4 :briefcase: Epic
####New Features
- *NovaTalks.UI*: Notifications - music play [:clipboard: NC2-202] [NC2-202]

- *NovaTalks.UI*: Notifications - blinking icon on browser's tab [:clipboard: NC2-201] [NC2-201]

####Bug Fixes
- *NovaTalks.UI*: Fixed corrupted endpoint for Change system language [:clipboard: NC2-272] [NC2-272]

- *NovaTalks.UI*: Fixed conversation dissappearing from list after filter tab change [:clipboard: NC2-278] [NC2-278]

- *NovaTalks.UI*: Fixed canned response search not refiltering results by short code [:clipboard: NC2-281] [NC2-281]

- *NovaTalks.UI*: Fixed canned response search causing Navigation Duplication error on conversation transition [:clipboard: NC2-282] [NC2-282]

- *NovaTalks.UI*: Fixed problem when canned response is not fully visualized in message entry field [:clipboard: NC2-268] [NC2-268]

- *NovaTalks.UI*: Fixed incorrect writing of Agent status to Redis DB [:clipboard: NC2-266] [NC2-266]

***

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

[Notifications functionality specification](https://drive.google.com/drive/folders/1rU0RPuJ_wzQaDuXy6bsLxDKMB28RW3hb)

####Bug Fixes
- *NovaTalks.UI*: Visual bug fix [:clipboard: NC2-182] [NC2-182]

	• *profile-settings-row* doesn't cover *dropdown-pane dropdown-pane–open*

	• *Delete button* do response in *Conversation filters* if filter has only one value

	• *Edit Contact* side menu do hide (gray out and inactivate) left side bar menus

	• *Keyboard shortcuts (modal-container)* is covered by content

	• In *Edit* menus (all) side bar menus are inactive

	• Importing file with wrong extension or values in *Import Contacts* shows error
	
	• Teams description doesn't go out of workspace bounds
	
	• Changed *New Password* field type to *password*

	• Added *Confirm New Password* to *Edit Agent* menu
	
	• Added *View Contact* button to *contact-info*

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

Variables and their default values:

<details><summary>Environment variables</summary>
<p>
``` js
LOGIN_STATUS='busy'
#status of agent on login
LOGOUT_TIMEOUT_OFFLINE=10000
#websocket connection timeout time
```
</p>
</details>

<details><summary>Redis environment variables</summary>
<p>
``` js
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

	- **Authorization flow**:

		1. Sending payload with password and username (mandatory field) on login

		2. On receiving, the backend checks in DB if user exist by **uid** (which is username) field

		3. If **exist** - determine authorization method by **provider** field

		> If **doesn't exist** - failed

		4. Authorization according to choosen method

<details><summary>Changed Log In payload</summary>
<p>

``` json
{
	password: "Rokdestbob322!!"
	sso_auth_token: ""
	username: "voll@gmail.com"
}
```
</details>
</p>

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

```	js	
SERVER_HOST=0.0.0.0
SERVER_PORT=3001
RUBY_HOST=http://srv-captain--novachats2-demo-chatwoot-web:3000
GENESYS_HOST=https://pureconnect.demo.novait.com.ua/api/192.168.124.160
NOVA_CHATS_ENGINE_HOST=http://srv-captain--novachats2-demo-engine:3000
NOVA_CHATS_PURECONNECT_CONNECTOR=http://srv-captain--novachats2-demo-pureconnect-connector:8000
GENESYS_STATUS_ONLINE=Available
GENESYS_STATUS_BUSY=Do Not disturb
```
</p>
</details>

> GENESYS_STATUS_ONLINE and GENESYS_STATUS_BUSY - statusId in Genesys.

> If does not exist, then sort by alphabet and choose first by isAcdStatus (true for "ONLINE" and false for "BUSY")

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

		> Icons are stored in **./assets/dashboard/images/channels**

	- **Contact Card - contact header**:

		• Mini icon: shows messanger icon by it's type stored in Conversation's attributes

		> Icons are stored in **./assets/dashboard/images/channels**

		• Mini title: prints messanger name from it's type stored in Conversation's attributes

		> Channel name (source) extracted from field: **additionalAttributes.contactSource**

	- **Conversations tab**:

		• Filters: added "All" option

		> All conversations are realized as concatenation on **Open** and **Resolved** conversations

		> Concatenation result is stored in Vue store

<details><summary>"additionalAttributes" - Send to Genesys format</summary>
<p>
``` json
{
"additionalAttributes":
	{
		"nova_contactName": "{firstname} {lastname}",
		"nova_contactEmail": "{userid}@{source}",
		"nova_contactChatId": "{chatId}",
		"nova_contactUserId": "{userid}",
		"nova_contactChannelId": "{channel}",
		"nova_contactSource": "{source}",
	}
}
```
</p>
</details>
  
> Restriction: without "contactSource" parameter the avatar wouldn't show up

####Bug Fixes
- none
***
