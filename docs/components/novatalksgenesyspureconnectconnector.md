{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.Genesys.PureConnect.Connector
##Product Notices
***
##2021R3
####New Features
- *Genesys.PureConnect.Connector*: Core development for outbound messages [:clipboard: NC2-21] [NC2-21]

	- **ChatProxy**:

		• in config cunfigured sending of variable **nova_chatid** with value **{chatid}**

		• in config sending of variables **nova_userid** with value **{userid}**

		• in config sending of variables **nova_source** with value **{source}**

	- **Nova.PureConnect.Connector**:

		• receiving **nova_chatid** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

		• receiving **nova_userid** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

		• receiving **nova_source** value and sending it in **AdditionalAttribute** (entity **Conversation**) 

	> Limitation: one contact for one channel

	> All client's interactions in one channel are stored in one conversation

	> Conversations are linked by **nova_chatid**, **nova_userid**, **nova_source**

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