#Checklist chatwoot for *Agent*

#**UI**
##*Log In page* 
Page elements:

 - [ ]  Logo
 - [ ]  Title
 - [ ]  Email field
 - [ ]  Password field
 - [ ]  Genesys user checkbox
 - [ ]  Login button

##*Main page*
Page elements:

1) Left side pannel

- [ ]  Hide\show side tabs pannel button
- [ ]  Search
- [ ]  Chat status filter
	- [ ]  Open
	- [ ]  Resolved
	- [ ]  All
- [ ]  Agent's personal chat list tab (chosen by default)
- [ ]  List of conversations with elements:
	- [ ]  Channel logo
	- [ ]  Channel mini logo
	- [ ]  Channel name
	- [ ]  Client's name in channel
	- [ ]  One line of conversation preview

2) Left side tabs pannel:

- [ ]  Logo
- [ ]  Conversations tab
- [ ]  Agent status ***Online***
- [ ]  Agent status ***Busy***
- [ ]  Agent avatar
- [ ]  Agent name field
- [ ]  Agent position
- [ ]  ***More options*** button:
	- [ ]  Profile Setting option
	- [ ]  Logout option

3) Conversation pannel (available only when conversation is choosen):

- [ ]  Channel logo
- [ ]  Channel name
- [ ]  ***More details*** button
- [ ]  ***More details*** change to ***Close details*** on click
- [ ]  ***Pick up*** active button
- [ ]  ***Resolve*** active button
- [ ]  ***Reply*** tab
- [ ]  ***Private Note*** tab

4) More details pannel:

- [ ]  Channel logo
- [ ]  Customer name
- [ ]  {{clientId}} + "@" + {{channel}} + {{channelId}} field
- [ ]  Phone number
- [ ]  ***Edit contact*** button
- [ ]  ***Conversation Lebels***
- [ ]  Conversation Lebels ***Edit*** button
	- [ ]  Edit submenu
- [ ]  ***Previous Conversations***

5) Edit contact submenu:
- [ ] ***Full name*** field
- [ ] ***Email*** field (with info in format {{clientId}} + "@" + {{channel}} + {{channelId}})
- [ ] ***Email*** field is unchangeble
- [ ] ***Decription*** field
- [ ] ***Phone number*** field
- [ ] ***Send*** button
- [ ] ***Cancel*** button

# Functionality
##Log In
- [ ] ***Login*** button is inactive without login
- [ ] ***Login*** button is inactive without password
- [ ] ***Login*** button is inactive without email part
- [ ] Change password is not possible with direct url
- 

##Conversation

- [ ]  Agent received text message
- [ ]  Agent received text with special symbol (!@#$%^;:&*()[]%20) message
- [ ]  Agent received text with emodji message
- [ ]  Agent received picture message
- [ ]  Agent received picture with text message
- [ ]  Agent received file (pdf, docx, xlsx) message
- [ ]  Agent received file with text message
- [ ]  Customer received text message
- [ ]  Customer received text with special symbol (!@#$%^;:&*()[]%20) message
- [ ]  Customer received text with emodji message
- [ ]  Customer received picture message
- [ ]  Customer received picture with text message
- [ ]  Customer received file (pdf, docx, xlsx) message
- [ ]  Customer received file with text message
- [ ]  Agent notes are present for all agents
- [ ]  Hovering on top of notes show creator
- [ ]  Previous conversation history is present for all agents
- [ ]  ***Pick up*** state change to ***Picked up*** after accepting chat
- [ ]  ***Resolve*** state change to ***Resolved*** after completing chat
- [ ]  Customer received outbound text message
- [ ]  Customer received outbound text with special symbol (!@#$%^;:&*()[]%20) message
- [ ]  Customer received outbound text with emodji message
- [ ]  Customer received outbound picture message
- [ ]  Customer received outbound picture with text message
- [ ]  Customer received outbound file (pdf, docx, xlsx) message
- [ ]  Customer received outbound file with text message

##Agents' chat queue

- [ ]  Two incoming chats from different channels
- [ ]  Two incoming chats the same channel different clients
- [ ]  Change of agent status to ***Busy*** if one of the chats is not accepted
- [ ]  Pick up two chats at the same time
- [ ]  Reassigment of chat from agent in ***Busy*** status


##Genesys integration

- [ ]  Impossibility of loging in with Genesys user checkbox activated for local users
- [ ]  Impossibility of loging in with Genesys user checkbox deactivated for genesys users
- [ ]  Impossibility of loging in for deleted from Genesys users
- [ ]  Password synchronization
- [ ]  Email Login part synchronization
- [ ]  Addition of **@chats.local** part for Genesys users without email
- [ ]  Agent status synchronization
- [ ]  Chat status synchronization
- [ ]  Agent account synchronization (with button)
- [ ]  Agent account synchronization (with connector restart)
- [ ]  Customer reply on outbound message goes on group