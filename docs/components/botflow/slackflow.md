#Nova.BotFlow Slack
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Truncates messages containing more than 40000 characters
```
</p>
</details>
####Pictures
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Formats: GIF, JPEG, PNG, and BMP
• Any size and resolution, but the overall files size is burdened by plan
• Up to 10 photos
```
</p>
</details>
####Files
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• One file can have any size, but the overall files size is burdened by plan
• Up to 5GB of files to workspace (free plan)
• 10GB per member on the Pro plan
• 20GB per member on the Business+ plan 
```
</p>
</details>
####Emoji
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

####Quick Replies
Quick Replies are supported as a disappearing after click/tap buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Blocks
• Maximum content length 3000 characters
• Maximum 5 buttons per row
• Maximum 49 rows
• Maximum label length 75 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/SlackFlowQuickReplies.png" title="Slack Quick Replies" width="600" height"500"> </a> </figure>
####Card
- Card is supported as a separate structure of *Picture*, *Title* with *Subtitle* and *Quick Replies* buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Blocks
• Known restrictions:
• Maximum title length 150 characters
• Maximum subtitle length 3000 characters
• Maximum label length 75 characters
• Maximum 5 buttons per row
• Maximum 47 rows
• Formats: GIF, JPEG, PNG, and BMP
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/SlackFlowCard.png" title="Slack Card" width="600" height"500"> </a> </figure>
####Button List
- Button List is supported as a Content with number of buttons positioned vertically
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Blocks
• Maximum content length 3000 characters
• Maximum 5 buttons per row
• Maximum 49 rows
• Maximum label length 75 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/SlackFlowButtonlist.png" title="Slack Button List" width="600" height"500"> </a> </figure>
####Button Grid
- Button Grid is supported as a Title with number of buttons positiononed vertically
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Blocks
• Maximum content length 3000 characters
• Maximum 5 buttons per row
• Maximum 49 rows
• Maximum label length 75 characters
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/SlackFlowButtongrid.png" title="Slack Button Grid" width="600" height"500"> </a> </figure>
####Carousel
- Carousel is supported as a number of Card type messages merged via blocks into one structure, where every card may have buttons (different, if needed)
<details><summary>Known Restrictions</summary>
<p>
```
• Type: Blocks
• Known restrictions:
• Maximum title length 150 characters
• Maximum subtitle length 3000 characters
• Maximum label length 75 characters
• Maximum 5 buttons per row
• Maximum 47 rows
• Formats: GIF, JPEG, PNG, and BMP
```
</p>
</details>
<figure> <img src="/novadocs/components/botflow/examples/SlackFlowCarousel.png" title="Slack Carousel" width="600" height"500"> </a> </figure>