#Nova.BotConnector Telegram
##Features
####Text
- Both directions: agent->client, client->agent

<details><summary>Known Restrictions</summary>
<p>
```
• Restriction 1
• Restriction 2
```
</p>
</details>
####Pictures
sending pictures from agent to client
sending pictures from client to agent

####Files
sending attachments from client to agent
sending attachments from agent to client

####Emoji
sending emoji from client to agent
sentding emoji from agent to client

####Typing
typing identificator is precent when agent writes a message

####Quick Replies
Quick Replies are supported as a disappearing after click/tap buttons
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
####Card
- [x] Card is supported as a separate structure of *Picture*, *Title* with *Subtitle* and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
Maximum 3 button rows
More than 3 button rows will be sent as a keyboard layout
```
</p>
</details>
####Button List
- [x] Button List is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum 100 button rows
```
</p>
</details>
####Button Grid
- [x] Button Grid is supported as a Title with number of buttons positioned horizontally 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum 8 buttons per row
```
</p>
</details>
####Carousel
- [x] Carousel is supported as a number of Card type messages, where only last one will have buttons  