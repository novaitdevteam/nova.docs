[NOV-29]: https://sd.novait.com.ua/browse/NOV-29
[NOV-63]: https://sd.novait.com.ua/browse/NOV-63
[NOV-66]: https://sd.novait.com.ua/browse/NOV-66
[NOV-73]: https://sd.novait.com.ua/browse/NOV-73
[NOV-78]: https://sd.novait.com.ua/browse/NOV-78
[NOV-92]: https://sd.novait.com.ua/browse/NOV-92
[NOV-100]: https://sd.novait.com.ua/browse/NOV-100
[NOV-117]: https://sd.novait.com.ua/browse/NOV-117
[NOV-119]: https://sd.novait.com.ua/browse/NOV-119
[NOV-139]: https://sd.novait.com.ua/browse/NOV-139
[NOV-149]: https://sd.novait.com.ua/browse/NOV-149
[NOV-171]: https://sd.novait.com.ua/browse/NOV-171
[NOV-186]: https://sd.novait.com.ua/browse/NOV-186
[NOV-187]: https://sd.novait.com.ua/browse/NOV-187
[NOV-222]: https://sd.novait.com.ua/browse/NOV-222
[NOV-223]: https://sd.novait.com.ua/browse/NOV-223
[NOV-256]: https://sd.novait.com.ua/browse/NOV-256
[NOV-259]: https://sd.novait.com.ua/browse/NOV-259
[NOV-286]: https://sd.novait.com.ua/browse/NOV-286
[NOV-305]: https://sd.novait.com.ua/browse/NOV-305

#Nova.ChatProxy.Genesys.PureConnect.ICWS
##Product Notices
***
##2021R4
###2021R4-4 :briefcase: Epic (unvalidated)
####New Features
- none

####Bug Fixes
- *WhatsApp (Infobip)*: fixed sending file issue (unsupported attachment type) [:clipboard: NOV-305] [NOV-305]
***

####New Features
- none

####Bug Fixes
- Fixed problem when session doesn't change status from *QUEUED* to *TALKING* [:clipboard: NOV-286] [NOV-286]
***

##2021R3
####New Features
- Expanded API routing ability [:clipboard: NOV-222] [NOV-222]

	> • Converstion now can be routed not only on Skillgroup, but also on Workgroup or directly to Agent

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

	> • Configuration file now can be outside component directory

- Extended parameters in template [:clipboard: NOV-223] [NOV-223]

	> • additionalAttributes: chatId, chatId, userId, channel

- *Under Construction* [:clipboard: NOV-186] [NOV-186]

####Bug Fixes
- Fixed problem with sending of conversation history to Genesis [:clipboard: NOV-187] [NOV-187]

	> • ICWS API support receiving request body with up to 15230 bytes, therefore, all older history would not be sent
***

##2021R2
####New Features
- Disabled message bufferization [:clipboard: NOV-171] [NOV-171]

####Bug Fixes
- Fixed bug with HA mod: added special identification to session which will negate possibility of client receiving few end dialog messages from all working ChatProxy [:clipboard: NOV-139] [NOV-139]

	> • Session now store Id of ChatProxy which it created

- Fixed bug where dublication of request which comes on ChatProxy creates second session that continues polling after first session ending [:clipboard: NOV-149] [NOV-149]
***

##2021R1
####New Features
- Added function to show previous chats history to agent [:clipboard: NOV-117] [NOV-117]

	> • The deepth of chat history can be modified
	
- Implemented incription and decription of stored chats history [:clipboard: NOV-117] [NOV-117]

####Bug Fixes
- Fixed active node switchover mechanism not working in new genesys update [:clipboard: NOV-92] [NOV-92]
***

##2020R4
####New Features
- none

####Bug Fixes
- Fixed component crush on sending animated stickers [:clipboard: NOV-119] [NOV-119]
***

##2020R3
####New Features
- none

####Bug Fixes
- Fixed corrupted links to saved files if they have special symbols in names [:clipboard: NOV-73] [NOV-73]
***

##2020R3
####New Features
- Added function to redirect chat from Omilia to the specified in chat variables skillgroup [:clipboard: NOV-100] [NOV-100]

	> • The skillgroup variable is specified in Omilia application logic

####Bug Fixes
- none
***

##2020R2
####New Features
- Added support of second node and implemented switchover of load to the second active node in case of first node malfunctioning [:clipboard: NOV-63] [NOV-63]
- Widened templete of userdata sent  [:clipboard: NOV-66] [NOV-66]:

<details><summary>Template</summary>
<p>
```
{userid}
{username}
{lastname}
{firstname}
{source}
{channel}
```
</p>
</details>

####Bug Fixes
- none
***

##2019R3
####New Features
- Implemented integration of ChatProxy with *Genesys PureConnect* [:clipboard: NOV-29] [NOV-29]

####Bug Fixes
- none