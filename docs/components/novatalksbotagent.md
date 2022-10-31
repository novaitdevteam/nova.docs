{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.BotAgent
##Product Notices
***
##2022R3
##2022R3-5
####New Features
- *NovaTalks.BotAgent*: Post Call Survey - flow scenario [:clipboard: NC2-227] [NC2-227]

	- CSAT scenario, by standard, is started when conversation changes status to **Resolved** 

	- CSAT works in chatwidget and messengers

	- CSAT logic doesn't change conversation status to **Open**

- *NovaTalks.BotAgent*: Write first to the client (WhatsApp Business) [:clipboard: NC2-258] [NC2-258]

	- Added **Default transport** and **Default config** in **	chatbot-chatwoot-connector-out** to use for outbound messaging

[Write first outbound messaging WhatApp Business](NC2-230_Функціонал_написати_першим_новому_клієнту_v0.3(NovaTalks).docx.pdf)

####Bug Fixes
- none
***
###2022R3-4 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent*: Syncronization with the forked Red Bot project  [:clipboard: NC2-243] [NC2-243]

	- Changed node names to NovaTalks on front-end

	> all backend node names left unchanged
	
	- New **Pop** and **Push** nodes
	
	> store **content** object in another object and return it back to the **content** object  

	- New Google Analytics node

<details><summary>Library Dependencies</summary>
<p>
```
info Direct dependencies
├─ log4js@6.6.1
└─ node-red-contrib-chronos@1.18.0
info All dependencies
├─ flatted@3.2.6
├─ log4js@6.6.1
├─ node-red-contrib-chronos@1.18.0
└─ streamroller@3.1.2

 

info Direct dependencies
├─ moment@2.29.4
└─ underscore@1.13.4
info All dependencies
├─ moment@2.29.4
└─ underscore@1.13.4

 

info Direct dependencies
├─ lodash@4.17.21
└─ mime-types@2.1.35
info All dependencies
├─ ieee754@1.2.1
├─ lodash@4.17.21
├─ mime-db@1.52.0
├─ mime-types@2.1.35
├─ peek-readable@5.0.0
├─ readable-web-to-node-stream@3.0.2
├─ strtok3@7.0.0
└─ token-types@5.0.1
```
</p>
</details>

####Bug Fixes
- none

***

###2022R3-3 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent.BA*: Outgoing chat initialization in numbered WhatsApp for business [:clipboard: NC2-230] [NC2-230]

[Outgoing chat functionality](./documents/novatalks/NC2-230_Функціонал_написати_першим_новому_клієнту_v0.1(NovaTalks).docx.pdf)

- *NovaTalks.BotAgent*: Numbered WhatsApp for business Botflow nodes develpment [:clipboard: NC2-253] [NC2-253]

	- Node supports following functionalities:
	
		• Text message - incoming and outgoing
	
		• Image message - incoming and outgoing 
	
		• Video message - incoming
	
		• File message (doc, docx, xls, xlsx, pdf, json, html, etc.) - incoming and outgoing
	
		• Location message - incoming

		• Group chats - incoming
	
		• Typing indicators

####Bug Fixes
- *NovaTalks.BotAgent*: Meta-Router Plug fix [:clipboard: NC2-238] [NC2-238]

	> wrong facebook client's route

***

###2022R3-1-2 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent.BA*: Keyboard node *Reply buttons* functionality support [:clipboard: NC2-188] [NC2-188]

	> done for viber and telegram channels

[Keyboard reply buttons for viber channel](./documents/novatalks/NC2-188_Viber_Add_Reply_Buttons_Compability_v0.1(NovaTalks).docx.pdf)

- *NovaTalks.BotAgent.BA*: Standard script modification [:clipboard: NC2-195] [NC2-195]

[Standard script schematic](./documents/novatalks/NC2-000_Basic_Script_v0.2(NovaTalks).vsdx)

- *NovaTalks.BotAgent*: Standard script develpment [:clipboard: NC2-214] [NC2-214]

####Bug Fixes
- none

***

##2022R2
###2022R2-5 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent*: Omilia integration - DEMO chatbot [:clipboard: NC2-65] [NC2-65]

	**Work flow**:
	
	1) Greeting and choice between **Omilia** and **Contact Agent**
		
	2) **Omilia**

		2.1. On entry user receive promt asking for user's question
			
		2.2. On trasfer user is sent on *Support* team
		
		2.3. Choice buttons are inactive until Omilia dialog transfer 
		
	3) **Contact Agent**
		
		2.1. Choice between agents and teams, with transfer on chosen one

		2.2. Promt to inform user that he is connected to an operator

		2.3. Buttons and other logic doesn't work when user speaks with operator

		2.4. On next user's message after conversation was resolved by operator, he will receive buttons with choice between Omilia and Contact Agent
			
		2.5. If previous conversation ended less that 5 minutes ago, then Contact Agent button will transfer to the same operator
			
####Bug Fixes
- none

***

###2022R2-3 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent*: *contact center Work Schedule* functionality [:clipboard: NC2-130] [NC2-130]

	> functionality is based on [Time Switch](https://github.com/jensrossbach/node-red-contrib-chronos/wiki/Time-Switch-Node) library

	- **Work algorithm**:
	
		> Subflow has two outputs: **match** and **no match**
	
		1. **msg** object enters **chronos-switch** node to check for specific days
	
		> Base Time can be took from: message **ingress**, **global.** variable, **flow.** variable, **msg.** object

		> specific days can be: holidays, corporate days or any other non-working dates

		2. **msg** object enters next **chronos-switch** node to check for day of week
	
		3. **msg** object enters next **chronos-switch** node to check for work hour

- *NovaTalks.BotAgent*: Statistics gathering with Google Analytics [:clipboard: NC2-154] [NC2-154]

	> functionality is based on [Google Analytics 4 Measurement Protocol](https://github.com/adswerve/GA4-Measurement-Protocol-Typescript) library

	> for work requires MEASUREMENT_ID and API_SECRET (can be taken from flow on Measurement Platform)

	> (for node-red flows variables ga4measurementId (MEASUREMENT_ID) and ga4apiSecret (API_SECRET) must be set in global variables)

	- Subflow input fields:
	
		1. **eventName**: name of the event which would be sent to Google Analytics

		2. **messanger**: transport of the message; took from the **msg** object

		3. **messangerChannel**: channel in which message was received; took from the **msg** object

		4. **messangerUser**: user identifier (name, id, etc.); took from the **msg** object

		5. **value**: event's value

<details><summary>Limitations</summary>
<p>
```
• Requests can have a maximum of 25 events.

• Events can have a maximum of 25 parameters.

• Events can have a maximum of 25 user properties.

• User property names must be 24 characters or fewer.

• User property values must be 36 characters or fewer.

• Event names must be 40 characters or fewer, may only contain alpha-numeric characters and underscores, and must start with an alphabetic character.

• Parameter names (including item parameters) must be 40 characters or fewer, may only contain alpha-numeric characters and underscores, and must start with an alphabetic character.

• Parameter values (including item parameter values) must be 100 character or fewer.

• Item parameters can have a maximum of 10 custom parameters.

• The post body must be smaller than 130kB.
```
</p>
</details>
<details><summary>Code example</summary>
<p>
```js
import ga4mp from "ga4-mp";
let ga4 = ga4mp.createClient(
  "jkEdpLiZTNuWi7EBhuQkcw",
  "G-J7W82BDKNQ",
  "11111111.4444444"
);

var events = [
  {
    name: "addtocart",
    params: {
      value: "4.99",
    },
  },
];
ga4.send(events);

ga4.readClientInfo();

import axios from "axios";

var data = JSON.stringify({
  client_id: "11111.55555",
  events: [
    {
      name: "axios_event",
      params: {},
    },
  ],
});

var config = {
  method: "post",
  url: "https://www.google-analytics.com/mp/collect?measurement_id=G-J7W82BDKNQ&api_secret=jkEpdLiZTNuWi7EBQkhucw",
  headers: {
    "Content-Type": "application/json",
  },
  data: data,
};
axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data));
  })
  .catch(function (error) {
    console.log(error);
  });
```
</p>
</details>

- *NovaTalks.BotAgent*: merge chat-platform repository with Nova.Botflow [:clipboard: NC2-155] [NC2-155]

####Bug Fixes
- none

***

###2022R2-2 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent*: Chatbot for UA.Novaposhta [:clipboard: NC2-141] [NC2-141]

####Bug Fixes
- *NovaTalks.Core*, *NovaTalks.BotAgent*: Added *chatwootconversationId* deletion in all redis db's [:clipboard: NC2-133] [NC2-133]

	> If client will write in two different bots connected to two different redis db's in contexts, it will create keys with information about dialogs in each of the db's.
	
	> When the client's contact is deleted from UI it will delete **chatwootconversationId** from the last dialog. 

	> In the second dialog, this parameter will remain and provoke **conversation not found** error which, in return, will broke bot.

***

###2022R2-1 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent*: Conversation auto resolve on inactivity [:clipboard: NC2-115] [NC2-115]
	
	- **Work algorithm**:

		• For every conversation in status **Open** on new incoming message (agent's and client's) set timer tied to Conversation Id in Redis
	
		> records has prefix: **lastMsg**
	
		• On key expire the http request will be sent to ChatWoot API to resolve conversation
	
		> timer lenght can be modified
	
	> for script to work there is need to add a variable to Redis:
	
	> 	**redis-cli config set notify-keyspace-events {{value}}**
	
	> 	where {{value}} is **Kx - prod**, **KEx - dev**
	
	> which will allow Redis to send Keyspace events on key expire
	
	> More info [here](https://redis.io/docs/manual/keyspace-notifications/#configuration)

####Bug Fixes
- *NovaTalks.Botflow*: Fixed invalid URI rebooting Botflow [:clipboard: NC2-124] [NC2-124]
***

##2022R1
###2022R1-6 :briefcase: Epic
####New Features
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

- *NovaTalks.BotFlow*: Presales Demo script improvement [:clipboard: NC2-112] [NC2-112]

	- Standard flow (only team transfer)

	- Extended flow (with transfer buttons on agents and teams)

		• auto transfer on Team in X minutes after dialog end

		> X - is a configurable parameter

		• Team will be the same, if was assigned, before dialog end 

####Bug Fixes
- none
***

###2022R1-1 :briefcase: Epic
####New Features
- *NovaTalks.BotAgent*: chatbot improvement for DEMO [:clipboard: NC2-62] [NC2-62]

	• Remembers the agent who wrote the outbound message (Redis or Memory)
	
	• When client write a message in X minutes after outbound message from the agent, the conversation is straightforwardly assigned to that agent
	
	>  X - is a configurable parameter

####Bug Fixes
- none
***

###2021R4
###2021R4-5
####New Features
- *NovaTalks.BotAgent*: DEMO chatbot [:clipboard: NC2-51] [NC2-51]

	• Texting chatbot with buttons: *greeting*, *chats transfer* on Teams and Agents by ID

	• Supports channels: **Viber**, **Telegram**, **Webchat**

####Bug Fixes
- none
***