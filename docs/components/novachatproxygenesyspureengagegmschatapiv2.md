[NOV-2]: https://sd.novait.com.ua/browse/NOV-2
[NOV-20]: https://sd.novait.com.ua/browse/NOV-20
[NOV-23]: https://sd.novait.com.ua/browse/NOV-23
[NOV-58]: https://sd.novait.com.ua/browse/NOV-58
[NOV-77]: https://sd.novait.com.ua/browse/NOV-77
[NOV-84]: https://sd.novait.com.ua/browse/NOV-84
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

##2020R4
####New Features
- Added sending of extra user data from WeChat [:clipboard: NOV-77] [NOV-77]

<details><summary>Extra Data</summary>
<p>
```
WeChatUser_Country	<country>
WeChatUser_Province	<province>
WeChatUser_City		<city>
WeChatUser_Sex		<sex>
WeChatUser_Language	<language>
WeChatUser_ImageURL	<headimgurl>
```
</p>
</details>

####Bug Fixes
- none
***

##2020R3
####New Features
- none

####Bug Fixes
- Fixed sending pictures from agent workplace to messager [:clipboard: NOV-84] [NOV-84]

	```PureEngage maximum allowed file size is 5Mb by default.```

***

##2020R2
####New Features
- Added sending of user information from messager [:clipboard: NOV-58] [NOV-58]:

<details><summary>Channel variables</summary>
<p>
```
{userid}
{username}
{lastname}
{firstname}
{source}
{type}
```
</p>
</details>


####Bug Fixes
- none
***

##2019R3
####New Features
- Implemented sending media from agent to client and from client to agent [:clipboard: NOV-20] [NOV-20]
- Integration with *Mongodb* with the help of *mongoose* driver [:clipboard: NOV-23] [NOV-23]

####Bug Fixes
- none
***

##2019R1
####New Features
- Developed module to integrate ChatProxy with *Genesys PureEngage* [:clipboard: NOV-2] [NOV-2]

####Bug Fixes
- none