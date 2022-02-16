{%
   include-markdown ".\links.md"
   start="<!--datelink-chatproxygenesyspureconnecticws-start-->"
   end="<!--datelink-chatproxygenesyspureconnecticws-end-->"
   rewrite-relative-urls=true
%}

{%
   include-markdown ".\glossary.md"
   start="<!--glossary-start-->"
   end="<!--glossary-end-->"
   rewrite-relative-urls=true
%}

#Nova.ChatProxy.Genesys.PureConnect.ICWS

*Nova.ChatProxy.Genesys.PureConnect.ICWS is a module of Nova.ChatsConnector for Genesys PureConnect Interaction Center Web Services (ICWS) Chat Integration*

##Features
###Component specific

- API routing ability to: Skillgroup, Workgroup, Agent [:material-location-enter:] [2021r3]
- Support of external configuration file [:material-location-enter:] [2021r3]
- Additional template userdata parameters: chatId, userId, channel [:material-location-enter:] [2021r3]
- Disabled message bufferization [:material-location-enter:] [2021r2]
- Function to show previous chats history to agent [:material-location-enter:] [2021r1]
- Incription and decription of stored chats history [:material-location-enter:] [2021r1]
- Function to redirect chat from Omilia to the specified in chat variables skillgroup [:material-location-enter:] [2020r3]
- Support of second node and switchover of load to the second active node in case of first node malfunctioning [:material-location-enter:] [2020r2]
- Additional template userdata parameters: username, lastname, firstname, source [:material-location-enter:] [2020r2]
- log4js logging [:material-location-enter:] [2019r3]

***

## Known Issues

- Attachments are not sent from agent ot client in Interaction Desktop [:material-location-enter:] [2021r3]