[NOV-11]: https://sd.novait.com.ua/browse/NOV-11
[NOV-25]: https://sd.novait.com.ua/browse/NOV-25
[NOV-45]: https://sd.novait.com.ua/browse/NOV-45
[NOV-46]: https://sd.novait.com.ua/browse/NOV-46
[NOV-101]: https://sd.novait.com.ua/browse/NOV-101
[NOV-106]: https://sd.novait.com.ua/browse/NOV-106
[NOV-123]: https://sd.novait.com.ua/browse/NOV-123
[NOV-125]: https://sd.novait.com.ua/browse/NOV-125
[NOV-137]: https://sd.novait.com.ua/browse/NOV-137
[NOV-169]: https://sd.novait.com.ua/browse/NOV-169
[NOV-256]: https://sd.novait.com.ua/browse/NOV-256
[NOV-259]: https://sd.novait.com.ua/browse/NOV-259

#Nova.ChatProxy.Cisco.ECE
##Product Notices
***
##2021R3
####New Features
- Implemented case insensitive work with userdata patterns [:clipboard: NOV-256] [NOV-256]
	
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

	```Configuration file now can be outside component directory```

####Bug Fixes
- none
***

##2021R2
####New Features
- Implemented showing conversation history with Omilia to agent as a separate message [:clipboard: NOV-169] [NOV-169]

	```Coversation history has limitation of 800 symbols, therefore history with larger symbol number can be sent to agent in few messages```

####Bug Fixes
- none
***

##2021R1
####New Features
- Added support of *smiles* in both ways: from client to agent and from agent to client [:clipboard: NOV-106] [NOV-106]
- Added possibility to sent email notification if the agent sends file to client and copy this messages to DLP system [:clipboard: NOV-137] [NOV-137]

####Bug Fixes
- none
***

##2020R4
####New Features
- Added sending of channel variables to component [:clipboard: NOV-123] [NOV-123]:

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
	
- Added functionality to not show system messages to agent [:clipboard: NOV-125] [NOV-125]

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
- Integration with *Mongodb* with the help of *mongoose* driver [:clipboard: NOV-25] [NOV-25]
- Routing on different EntryPoints for *BotConnector* [:clipboard: NOV-45] [NOV-45]
- Implemented sending of conversation history with the chatbot [:clipboard: NOV-46] [NOV-46]

####Bug Fixes
- none
***

##2018R4
####New Features
- Developed full compatibility with *Nova.BotConnector* [:clipboard: NOV-11] [NOV-11]
- Creation of installation rpm package [:clipboard: NOV-11] [NOV-11]

####Bug Fixes
- none