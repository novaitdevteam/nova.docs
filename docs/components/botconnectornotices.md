{%
   include-markdown "./links.md"
   start="<!--datelink-botconnector-start-->"
   end="<!--datelink-botconnector-end-->"
   rewrite-relative-urls=true
%}

{%
   include-markdown "./glossary.md"
   start="<!--glossary-start-->"
   end="<!--glossary-end-->"
   rewrite-relative-urls=true
%}

#Nova.BotConnector

*Nova.BotConnector is a JavaScript connector to connect messagers and unification of work with them*

##Features
###Component specific

- log4js logging [:material-location-enter:] [2018r4]
- Ability to store user data and conversation data in *Mongodb* [:material-location-enter:] [2018r4]
- Ability to delete user data and conversation data from *Mongodb* [:material-location-enter:] [2018r4]
- High-availability cluster *Mongodb* support (on *mongoose* driver level) [:material-location-enter:] [2019r3]
- Proxy Server support [:material-location-enter:] [2020r3]
- Conversations cleanup (bson cleanup) service with customizable launch timer [:material-location-enter:] [2021r1]

***

###All channels

- Service with DELETE method for deletion of old messages from database [:material-location-enter:] [2018r4] 
- Outbound messaging support [:material-location-enter:] [2021r2]

	> Three outbound messaging work algorithms:
	
	> - simple outbound message

	> - outbound message with agent or workgroup\skillgroup reservation for routing

	> - outbound message with instant routing on agent or workgroup\skillgroup

- Function of autodeletion of user privacy related data from database after conversation [:material-location-enter:] [2021r2]
- Sending of REF value from uri to Omilia context at the start of conversation [:material-location-enter:] [2021r2]
- Sending of **Avatar** (local storage link on user's picture) parameter to ChatProxy [:material-location-enter:] [2021r4]
- Limitation on agent reply ability to comment\post [:material-location-enter:] [2021r4]

***

###Channel specific
####Telegram

- Sending of **/start** command following text as REF parameter [:material-location-enter:] [2020r4]
- Typing Indicator when agent write a message [:material-location-enter:] [2021r3]

####Viber

- Sending of *userid* in template [:material-location-enter:] [2020r3]
- Typing Indicator when agent write a message [:material-location-enter:] [2021r3]

####Facebook

- Receiving of additional user information (*firstname*, *lastname*, *username*) [:material-location-enter:] [2021r2]
- Typing Indicator when agent write a message [:material-location-enter:] [2021r3]
- Customizable timeout limit for big media files sending [:material-location-enter:] [2021r4]

####Facebook Wall Posts

- Polling service [:material-location-enter:] [2021r4]

####Twitter

- Customizable timeout limit for big media files sending [:material-location-enter:] [2021r4]

####WhatsApp (Nexmo)

- Migration from API v0.1 to API v1 [:material-location-enter:] [2021r4]
- JWT authentification in compliance with the API v1 [:material-location-enter:] [2021r4]

####WeChat

- Sending of *first name* and *parential* (*ancestral*) *name* to PureEngage [:material-location-enter:] [2020r2]

####WebChat

- Receiving of additional user information (*firstname*, *lastname*) [:material-location-enter:] [2021r2]