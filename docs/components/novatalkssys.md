{%
   include-markdown ".\links.md"
   start="<!--tasklink-start-->"
   end="<!--tasklink-end-->"
   rewrite-relative-urls=false
%}

#NovaTalks.Sys
##Product Notices
***
##2022R2
###2022R2-2 :briefcase: Epic
- *NovaTalks.Sys*: Configuring dbmanager to access DB in k3s crossnamespaced [:clipboard: NC2-129] [NC2-129]

	- Theme: [Adminer Bootstrap-Like Design](https://github.com/natanfelles/adminer-bootstrap-like)

	- **Plugins**:
	
		> Adminer plugins
	
		- plugin: Required to run any plugin
		
		- database-hide: Hide some databases from the interface - just to improve design, not a security plugin

		- dump-alter: Exports one database (e.g. development) so that it can be synced with other database (e.g. production) (screencast)

		- dump-json: Dump to JSON format

		- dump-xml: Dump to XML format in structure \<database name=""\>\<table name=""\>\<column name=""\>value

		- dump-zip: Dump to ZIP format

		- json-column: Display JSON values as table in edit

		- pretty-json-column: Pretty print JSON values in edit
		
		- version-noverify: Disable version checker

		> User contributed plugins
		
		- dump-xml-dataset (Michal Brašna): Dump to XML format specifically PHPUnit's
		
		- XML DataSet structure
		
		- FasterTablesFilter (Martin Macko)
		
		- StickyColumns (Stephan)
		
		- tree-view (Petro Kostyuk)

####Bug Fixes
- none
***

###2022R2-1 :briefcase: Epic
####New Features
- *NovaTalks.Sys*: Utilities for Kubernetes configuration [:clipboard: NC2-117] [NC2-117]

- *NovaTalks.Sys*: Multi instance work testing [:clipboard: NC2-108] [NC2-108]

	• two instances were separated in their own acconts
	
	> (convarsations, inboxes, etc. can have the same id in BD)

	• one botflow with a bot for each instance

	> there is a need to put precise resource limit (agents and inboxes) for an instance, or the messages won't be sent to ChatWoot

	• can be one PostgreSQL and Redis for all instances 

- *NovaTalks.Sys*: Docker image for ChatWoot v2.2 [:clipboard: NC2-118] [NC2-118]

	> In build the **de** localizations is substituted by **uk** localization (files substitute)

####Bug Fixes
- none
***

##2022R1
###2022R1-6 :briefcase: Epic
####New Features
- *NovaTalks.Sys*: Kubernetes on k8s basis based on k3d [:clipboard: NC2-116] [NC2-116]

	Main Points:

	• kubernetes

	• k3s Rancher

	• control utilities k8s and k9s

####Bug Fixes
- none
***