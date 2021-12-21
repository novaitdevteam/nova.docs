#Nova.BotConnector Viber
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
- [x] Quick Replies are supported as a not disappearing after click/tap keyboard buttons
<details><summary>Known Restrictions</summary>
<p>
```
Keyboards:
Maximum content length 7000 characters
Maximum number of rows is 24
Maximum number of columns is 6
Font size can be changed between 12 and 32
```
</p>
</details>
###Card
- [x] Card is supported as a monolith structure with *Title*, *Subtitle*, *Subtitle*, and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
Keyboards:
Maximum length of Title with Subtitle is 239 characters
Maximum length of Label is 250 characters
Maximum 3 buttons

```
</p>
</details>
###Button List
- [x] Button List is supported as a Title with number of keyboard buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum content length 7000 characters
Maximum number of rows is 24
Font size can be changed between 12 and 32
```
</p>
</details>
###Button Grid
- [x] Button Grid is supported as a Title with number of buttons positioned vertically 
<details><summary>Known Restrictions</summary>
<p>
```
Maximum content length 7000 characters
Maximum number of rows is 24
Maximum number of columns is 6
Font size can be changed between 12 and 32
```
</p>
</details>
###Carousel
- [x] Carousel is supported as a monolith structure with *Picture*, *Header* (Title), *Details* (Subtitle), and not disappearing *Buttons* (Call to Action)
<details><summary>Known Restrictions</summary>
<p>
```
Maximum content length 7000 characters
Maximum number of columns per carousel content block is 6
Maximum number of rows per carousel content block is 7
Maximum array of buttons is 6 * "columns per carousel content block" * "rows per carousel content block"
```
</p>
</details>