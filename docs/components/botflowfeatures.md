{%
   include-markdown ".\links.md"
   start="<!--datelink-botflow-start-->"
   end="<!--datelink-botflow-end-->"
   rewrite-relative-urls=true
%}

{%
   include-markdown ".\glossary.md"
   start="<!--glossary-start-->"
   end="<!--glossary-end-->"
   rewrite-relative-urls=true
%}

#Nova.BotFlow

*Nova.BotFlow is a module for Nova.ChatsConnector and is a tool to not just connect messagers, but also create full fledged user scenarios*

##Features
###Component specific

- Ability to store user data and conversation data in *Mongodb* [:material-location-enter:] [2021r2] and *Redis* [:material-location-enter:] [2021r3]
- Ability to delete user data and conversation data from *Mongodb* [:material-location-enter:] [2021r2] and *Redis* [:material-location-enter:] [2021r3]
- Native attachment sending (no URL) for PureEngage [:material-location-enter:] [2021r2] 
- log4node logging [:material-location-enter:] [2021r3]
- Parallel work of the same channels with different configuration on separate flows [:material-location-enter:] [2021r3]
- Logging to external .log file on server [:material-location-enter:] [2021r3]
- Migration to Node.Red version 2.X [:material-location-enter:] [2021r3]
- Backward compatibility of inbuild nodes [:material-location-enter:] [2021r3]
- RedBot 0.19.11 functionality transfer [:material-location-enter:] [2021r4]

***

###All channels

- Bufferization of media content for optimization of flow building [:material-location-enter:] [2021r2]
- **Redis** as a context provider [:material-location-enter:] [2021r3]
- Functionality to call second Omilia app [:material-location-enter:] [2021r3]
- **sessionRefreshTimeout** in Omilia conversations [:material-location-enter:] [2021r3]
- Webhooks are following one set URL template (excluding Apple channel) [:material-location-enter:] [2021r3]
- Few bots can be setup on one channel at the same time (in different flows or with switch) [:material-location-enter:] [2021r3]
- ChatWoot connector [:material-location-enter:] [2021r4]
- Integration with ChatWoot Agent Bot [:material-location-enter:] [2021r4]
- Outbound messaging support [:material-location-enter:] [2021r3]

	> Three outbound messaging work algorithms:
	
	> - simple outbound message

	> - outbound message with agent or workgroup\skillgroup reservation for routing

	> - outbound message with instant routing on agent or workgroup\skillgroup

- ChatProxy (ECE, PureEngage, PureCloud) support for existing channels [:material-location-enter:] [2021r3]
- **Message Queue** node with ability to store messages and retrive then on request [:material-location-enter:] [2021r4]

***

###Channel specific
####Apple Business Chat

- Support of Omilia buttons [:material-location-enter:] [2021r2]
- Typing Indicator and identificators of chat's session ending (actions) [:material-location-enter:] [2020r4]
- Nodes  [:material-location-enter:] [2021r1]:
	* *Authentication*: node **Apple Auth** for autorization
	* *Apple Pay*: node **Apple Pay** to pay for services/goods
	* **Custom Interactive Messages**: node adds ability to send data structures that can be rendered by custom ABC application

- Smiles are converted in unicode before sending to Omilia [:material-location-enter:] [2021r3]

####WhatsApp (Nexmo)

- Support of API v1 with backwards compatibility of API v0.1 [:material-location-enter:] [2022r1]

####NovaTalks

- Support of inbox Bot Agent with scripting scenarios, transfer to Omilia or Agent/Team
- Autorefreshing Combobox selection of Agents and Teams in transfer node