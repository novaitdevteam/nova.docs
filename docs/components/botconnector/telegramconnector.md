#Nova.BotConnector Telegram
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
- [x] sentding emoji from agent to client

###Typing
- [x] typing identificator is precent when agent writes a message

###Quick Replies
- [x] Quick Replies are supported as a disappearing after click/tap buttons
<details><summary>Known Restrictions</summary>
<p>
```
Keyboards:
Maximum label (buttons text) length 75 characters
Maximum content length 3000 characters
Maximum 5 buttons per row
Maximum 49 rows

Inline Keyboard:
Maximum 8 buttons per row
Maximum 100 button rows
```
</p>
</details>
###Card
- [x] Card is supported as a separate structure of *Picture*, *Title* with *Subtitle* and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
Maximum 3 button rows
More than 3 button rows will be sent as a keyboard layout
```
</p>
</details>
###Button List
- [x] Button List is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum 100 button rows
```
</p>
</details>
###Button Grid
- [x] Button Grid is supported as a Title with number of buttons positioned horizontally 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum 8 buttons per row
```
</p>
</details>
###Carousel
- [x] Carousel is supported as a number of Card type messages, where only last one will have buttons  