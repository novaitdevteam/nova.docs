{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.BotAgent
##Product Notices
***
##2022R2
###2022R2-4 :briefcase: Epic
####New Features
-

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