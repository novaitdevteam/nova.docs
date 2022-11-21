{%
   include-markdown "./links.md"
   start="<!--datelink-chatproxyciscoece-start-->"
   end="<!--datelink-chatproxyciscoece-end-->"
   rewrite-relative-urls=true
%}

{%
   include-markdown "./glossary.md"
   start="<!--glossary-start-->"
   end="<!--glossary-end-->"
   rewrite-relative-urls=true
%}

#Nova.ChatProxy.Cisco.ECE

*Nova.ChatProxy.Cisco.ECE is a module of Nova.ChatsConnector for Cisco ECE Integration*

##Features
###Component specific

- Case insensitive work with userdata patterns [:material-location-enter:] [2021r3]
- Support of external configuration file [:material-location-enter:] [2021r3]
- Conversation history with Omilia shown to agent as a separate message [:material-location-enter:] [2021r2]
- Mechanism to block sending of attachments from agent [:material-location-enter:] [2021r2]
- Support of *smiles* both ways: client:material-arrow-right:agent and agent:material-arrow-right:client [:material-location-enter:] [2021r1]
- Functionality to send email notification if the agent sends file to client and copy this messages to DLP system [:material-location-enter:] [2021r1]
- Receiving of channel variables from components [:material-location-enter:] [2020r4]
- Functionality to hide system messages from agent [:material-location-enter:] [2020r4]
- Multiinstance support [:material-location-enter:] [2020r1]
- Integration with high-availability *Mongodb* cluster [:material-location-enter:] [2020r1]
- Routing on different EntryPoints for *BotConnector* [:material-location-enter:] [2020r1]
- Sending of chatbot conversation history [:material-location-enter:] [2020r1]
- Full compatibility with *BotConnector* [:material-location-enter:] [2018r4]
- log4js logging [:material-location-enter:] [2018r4]