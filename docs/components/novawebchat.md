{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#Nova.WebChat
##Product Notices
***
##2018R3
####New Features
- Developed a webchat integration to connector (based on RECAST AI webchat):
	* functionality check [:clipboard: NOV-8] [NOV-8]
	* backend development [:clipboard: NOV-9] [NOV-9]

	> • server connector for chat (NodeJS) with ability to load previous conversation content from MongoDB

	* frontend development [:clipboard: NOV-10] [NOV-10]

	> • deleted/changed all excess code for seamless integration with BotConnector
	
	> • configuration can now be loaded from static json file

####Bug Fixes
- none