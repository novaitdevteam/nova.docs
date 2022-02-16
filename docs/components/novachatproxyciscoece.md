{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#Nova.ChatProxy.Cisco.ECE
##Product Notices
***
##2021R3
####New Features
- Implemented case insensitive work with userdata patterns [:clipboard: NOV-256] [NOV-256]

	> • Case insensitive work with parameters in template written in configuration file

<details><summary>Template</summary>
<p>

```
{userId}
{chatId}
{conversation}
{channel}
{source}
{slug}
{username}
{firstname}
{lastname}
```
</p>
</details>

- Added support of external configuration file [:clipboard: NOV-259] [NOV-259]

	> • Configuration file now can be outside component directory
	
	> Path to file can be set in three ways:
	
	> • Envirounment variable CHATPROXY_INSTANCE.
	
	> (Read configuration from "config" directory) 

	> • Envirounment variables CONFIG_DIR and CONFIG_FILE

	> (Read configuration from "$CONFIG_DIR/$CONFIG_FILE")

	> • Service node index.js /path/to/configurationfile/config.js launch parameter

	> (Read configuration from "/path/to/configurationfile/config.js")

####Bug Fixes
- none
***

##2021R2
####New Features
- Implemented showing conversation history with Omilia to agent as a separate message [:clipboard: NOV-169] [NOV-169]

	> • Coversation history has limitation of 800 symbols, therefore history with larger symbol number can be sent to agent in few messages

- Realized blocking of attachments sending from agent [:clipboard: NOV-166] [NOV-166]

	> • In configuration **disableAgentAttachment** field

####Bug Fixes
- none
***

##2021R1
####New Features
- Added support of *smiles* both ways: from client to agent and from agent to client [:clipboard: NOV-106] [NOV-106]
- Added possibility to sent email notification if the agent sends file to client and copy this messages to DLP system [:clipboard: NOV-137] [NOV-137]

####Bug Fixes
- none
***

##2020R4
####New Features
- Added receiving of channel variables from components [:clipboard: NOV-123] [NOV-123]:

<details><summary>Channel variables</summary>
<p>
```
lastName
firstName
entryPointId
locale
templateName
conversationid
```
</p>
</details>
	
- Added functionality to hide system messages from agent [:clipboard: NOV-125] [NOV-125]

####Bug Fixes
- Fixed problem with *Space* symbol sending as *&nbsp;* [:clipboard: NOV-101] [NOV-101]
- Fixed event when agent at the start of chat received two indentical messages [:clipboard: NOV-101] [NOV-101]
- Fixed problem with duplication of *Spece* symbols in messages from agent to client [:clipboard: NOV-101] [NOV-101]
- Fixed problem when restart of *ChatProxy* cause error if one of the conversations is in status *TALKING* [:clipboard: NOV-123] [NOV-123]
- Fixed problem when service cannot be restarted without deletion of all sessions from database [:clipboard: NOV-123] [NOV-123]
***

##2020R1
####New Features
- Added Multiinstance support [:clipboard: NOV-25] [NOV-25]

	> • Backwards compatibility with single instance configuration

	> • "uri" parameter in "db" (database) section. 
	
	> (it is ignored if exist old parameters exist: host, port, dbName)

	> • Logging of used parameters
	
<details><summary>Old config example</summary>
<p>
```
	db: {
        host: '127.0.0.1',
        port: '27017',
        dbName: 'nova-botconnector',
        debugMode: false,
        options: {
            useNewUrlParser: true,
            reconnectTries: Number.MAX_VALUE,
            reconnectInterval: 1000,
            poolSize: 10,
            connectTimeoutMS: 5000,
            family: 4,
            keepAlive: true,
            keepAliveInitialDelay: 300000,
        },
    }
```
</p>
</details>

<details><summary>New config example</summary>
<p>
```
	db: {


        uri: "mongodb://localhost:27022/chat,localhost:27021,localhost:27020",
        options: {
            useNewUrlParser: true,
            reconnectTries: Number.MAX_VALUE,
            reconnectInterval: 1000,
            poolSize: 10,
            connectTimeoutMS: 5000,
            family: 4,
            keepAlive: true,
            keepAliveInitialDelay: 300000,
        },
    }
```
</p>
</details>
	
- Integration with high-availability cluster *Mongodb* (on *mongoose* driver level) [:clipboard: NOV-25] [NOV-25]
- Routing on different EntryPoints for *BotConnector* [:clipboard: NOV-45] [NOV-45]
- Implemented sending of chatbot conversation history [:clipboard: NOV-46] [NOV-46]

####Bug Fixes
- none
***

##2018R4
####New Features
- Developed full compatibility with *BotConnector* [:clipboard: NOV-11] [NOV-11]
- Creation of installation rpm package [:clipboard: NOV-11] [NOV-11]

####Bug Fixes
- none