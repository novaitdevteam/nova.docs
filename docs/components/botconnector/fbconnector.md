#Nova.BotConnector Facebook Messager
##Features
###Text
- [x] sending text from agent to client
- [x] sending text from client to agent

###Pictures
- [x] sending pictures from agent to client
- [x] sending pictures from client to agent

###Files
- [x] sending attachments from client to agent
- [x] sending attachments from agent to client

###Emoji
- [x] sending emoji from client to agent
- [x] sending emoji from agent to client

###Typing
- [x] typing identificator is precent when agent writes a message

###Quick Replies
- [x] Quick Replies are supported as a disappearing after click/tap buttons
<details><summary>Known Restrictions</summary>
<p>
```
Keyboards:
Maximum label (buttons text) length 23 characters in Web client and Mobile client
Maximum label (buttons text) length 14 characters on Facebook website in widget 
Maximum 13 buttons
Context (Action Prompt) is required
```
</p>
</details>
###Card
- [x] Card is supported as a monolith structure of *Picture*, *Title*, *Subtitle*, and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
Maximum Title length is 80 characters
Maximum Subtitle length is 80 characters
Maximum 3 buttons
Maximum label (buttons text) length 23 characters in Web client and Mobile client
Maximum label (buttons text) length 14 characters on Facebook website in widget
```
</p>
</details>
###Button List
- [x] Button List is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum Title length is 640 characters
Maximum 3 buttons
Maximum label (buttons text) length 23 characters in Web client and Mobile client
Maximum label (buttons text) length 14 characters on Facebook website in widget
Context (Action Prompt) is required
```
</p>
</details>
###Button Grid
- [x] Button Grid is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum Title length is 640 characters
Maximum 3 buttons
Maximum label (buttons text) length 23 characters in Web client and Mobile client
Maximum label (buttons text) length 14 characters on Facebook website in widget
Context (Action Prompt) is required
```
</p>
</details>
###Carousel
- [x] Carousel is supported as a monolith structure with *Picture*, *Header* (Title), *Details* (Subtitle), and not disappearing *Buttons*
<details><summary>Known Restrictions</summary>
<p>
```
Maximum up to 10 carousel blocks (cards)
Maximum Title length is 80 characters
Maximum Subtitle length is 80 characters
Maximum 3 buttons
Maximum label (buttons text) length 23 characters in Web client and Mobile client
Maximum label (buttons text) length 14 characters on Facebook website in widget
Context (Action Prompt) is required
```
</p>
</details>