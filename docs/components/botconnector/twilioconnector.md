#Nova.BotConnector Twilio
##Features
####Text
- Both directions: *agent* :material-arrow-right: *client*, *client* :material-arrow-right: *agent*

<details><summary>Known Restrictions</summary>
<p>
```
• Message will be sent as plain text
• Maximum message length: 1600 characters
• More than 70 UCS-2 chars  (or 160 GSM-7) will be split as a segmented SMS
```
</p>
</details>

####Quick Replies
Quick Replies are supported as a disappearing after click/tap **inline keyboard** buttons
<details><summary>Known Restrictions</summary>
<p>
```
• Type SMS
• Message will be sent as plain text
• Maximum message length: 1600 characters
• More than 70 UCS-2 chars  (or 160 GSM-7) will be split as a segmented SMS
```
</p>
</details>
<figure> <img src="/novadocs/components/botconnector/examples/TwilioConnectorQuickReplies.png" title="Twilio Quick Replies" width="600" height"500"> </a> </figure>