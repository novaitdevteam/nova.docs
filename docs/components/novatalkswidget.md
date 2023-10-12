{%
   include-markdown "./links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.ChatWidget
##Product Notices
***

##2023R2

###2023R2-5-6 :briefcase: Epic

####New Features

- *NovaTalks.ChatWidget*: Added an option to display the agent's avatar and name in the online chat. [:clipboard: NC2-611](https://sd.novait.com.ua/browse/NC2-611)

	- Added a "Show agent name" and " Show agent avatar" checkbox button in the **Inboxes** settings.


####Bug Fixes

- *NovaTalks.ChatWidget*: Fixed a case where the client could not create a dialog on OS Android. [:clipboard: NC2-511](https://sd.novait.com.ua/browse/NC2-511)

	- User data storage has been moved from *cookie* in *localStorage*.


- *NovaTalks.ChatWidget*: Fixed **vue** styles conflict between widget and websites. [:clipboard: NC2-707](https://sd.novait.com.ua/browse/NC2-707)

	> Websites based on **vue** framework have conflicting basics styles with widget which is also created on the vue basis.

***

##2022R3

###2022R3-5 :briefcase: Epic

####New Features
- none

####Bug Fixes
- *NovaTalks.ChatWidget*: Fixed chatwidget style conflict on websites[:clipboard: NC2-317] [NC2-317]

	- Standard css styles in chatwidget overrided styles on client's websites 

***

###2022R3-4 :briefcase: Epic
####New Features
- *NovaTalks.ChatWidget*: Change of standard Welcome Message promts [:clipboard: NC2-269] [NC2-269]

	> ChatWidget can not have empty Welcome Message

	> Leaving empty Welcome Message in the Inbox setting will fill Welcome Message with standard one

	- Standard prompts changed to:

	- **EN**: Welcome! 👋

	- **RU**: Добро пожаловать! 👋

	- **UA**: Вітаємо! 👋

####Bug Fixes
- *NovaTalks.ChatWidget*: Fixed problem when regardless of mandatory fields to fill, the chatform require all of them to be filled in [:clipboard: NC2-254] [NC2-254]

- *NovaTalks.ChatWidget*: Fixed problem when locale change does not change Welcome Message promt in ChatWidget [:clipboard: NC2-269] [NC2-269]

- *NovaTalks.ChatWidget*: Fixed problem when ChatWidget style does override standard styles on website [:clipboard: NC2-270] [NC2-270]

	> added new classes

	> wrapped new styles through id

***

##2022R2
###2022R2-3 :briefcase: Epic
####New Features
- *NovaTalks.ChatWidget*: alternative Static Widget [:clipboard: NC2-158] [NC2-158]

	> Alternative widget is not tied to the ChatWoot based widget

	- Supports more that one channels of the same type 
	
	- Has transparent background 
	
<details><summary>Script example</summary>
<p>
``` html
<html>
  <head>
    <title>NovaTalks Demo Standalone Chat</title>
  </head>
  <body>
    <script>
      (function (d, t) {
        var BASE_URL = 'http://localhost:3012';
        var g = d.createElement(t),
          s = d.getElementsByTagName(t)[0];
        g.src = BASE_URL + '/packs/js/sdk.js';
        g.defer = true;
        g.async = true;
        s.parentNode.insertBefore(g, s);
        g.onload = function () {
          window.chatwootSDK.run({
            websiteToken: 'FReCS3jYPvr8HsdLSpHU6DuT',
            baseUrl: BASE_URL,
            bubbleImage: 'https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg', // Optional
            widgetControl: {
              channels: [
                {
                  name: 'Telegram1', // Required
                  type: 'telegram', // Required Enam: telegram, viber, messenger, twitter, facebook, whatsapp
                  url: 'https://t.me/novachatsbot?start=clk-901008', // Required
                  hint: 'telega 1 hint', // Optional
                  enabled: true, // Optional. Boolean: true or false.
                },
              ],
              imageSize: 'medium', // Optional. Enam: small, medium, large
            },
          });
        };
      })(document, 'script');
    </script>
  </body>
</html>
```
</p>
</details>
####Bug Fixes
- none
***

###2022R2-2 :briefcase: Epic
####New Features
- none

####Bug Fixes
- *NovaTalks.ChatWidget*: Fixed Webwidget auto close on mobile devices [:clipboard: NC2-134] [NC2-134]

	> Webwidget closes on mobile devices when keyboard is evoked
***

###2022R2-1 :briefcase: Epic
####New Features
- *NovaTalks.ChatWidget*: Conversation widget [:clipboard: NC2-7] [NC2-7]

	Library: [vue-social-sharing](https://github.com/nicolasbeauvais/vue-social-sharing)

	Widget is based on [NovaChats](https://novachats.com)
	
	- in passive state: round icon with preview of message from agent

	- on click: shows vertical list of contact channels
	
	 	• **Web Chat** option opens chat form

		• **Messenger** options opens redirect pages with invite to the chatbot

####Bug Fixes
- *NovaTalks.UI*: Frontend modification [:clipboard: NC2-109] [NC2-109]

	- **UI**:
	
		• added to **@ Mentions** tab Beta flag

		• hidden **Ticket close timer** in the Account Setting

		• hidden **Conversation continuity with emails**

		• hidden **Ticket auto resolve by no activity timer**

		• hidden **Email Notifications** in Profile Settings

		• hidden **Personal Signature** in Profile Settings

		• hidden **Enable channel greeting**, **CSAT**, **Business hours** in API Inbox settings

		• hidden **CSAT** in Webchat Inbox settings

		• hidden **Enforce User Indetity Validation** in Webchat Inbox settings
	
		• hidden **Conversation continuity via email** in Webchat Inbox settings

		• changed **Электронная почта** section to "Источник" in Reports in russian locale

		• hidden **Send Message** button in Contacts

		• hidden **Email collect box** from Widget Inbox settings

		• fixed **Custom date range** date subwindow showing

		• fixed agent being unable to **mention** another agent in **Private Notes**

	- **Widget**:

		• fixed unsupported and not sent files from client's side staying at the bottom of the chatting window 

		• added **hide widget**	button

		• deleted **Welcome Messages**

	> Additional information:
	
	> • BotAgent does work with both widget and messangers (2 different inboxes) at the same time

	> • When the same name and email are filled in online chat, the new contact isn't created in BD, but conversation does

	> • If the client is in online chat, he will have a green marker at his avatar

***

##2022R1
###2022R1-3 :briefcase: Epic
####New Features
- *NovaTalks.ChatWidget*: Widget code transfer on our Kernel [:clipboard: NC2-63] [NC2-63]

	• Ported Widget code

	• Ported SDK

	• Deleted "Powered By ChatWoot" sign

	• Optimized Widget bundle
	
	• New Proxing rules in UI for getting Widget files
	
	> envirounment variable "**WIDGET_SOURCE_HOST**"
	
<details><summary>Widget and SDK build info</summary>
<p>
```
Build the SDK
$ yarn build:sdk

Build the Widget
$ yarn build:widget

Folder structure
	•config: 
	webpack config files

	•dist: 
	Contains the built files generated by the scripts (dev package, minified package and map)

	•javascript: 
	Contains an index file that requires all the modules that should be exported and all the source files that compound the package.
	It was copied from https://github.com/chatwoot/chatwoot/tree/v2.1.1/app/javascript

Modified files:
	• javascript/shared/components/Branding.vue

Entry point widget: javascript/packs/widget.js
Entry point sdk: javascript/packs/sdk.js
```
</p>
</details>

####Bug Fixes
- none
***
