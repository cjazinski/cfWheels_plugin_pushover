<h1>cfWheels_plugin_pushover</h1>
<hr />

Author: Christopher Jazinski <br />
Version: 0.1a <br />
Last Modified: 01/27/2014 <br />
Description: This will allow you to integrate with the Pushover API to send messages
<br />
Installation: Place the Zip folder in your plugins directory. CfWheels should unzip<br />
PreReqs: You must define a few variables in the settings so the pushover plugin
knows your API and Application key. You can register your application (and obtain both keys) at pushover.net. ALSO YOU MUST HAVE A PUSHOVER ACCOUNT AND APP (ios/droid)
<br /> <br />
How to Use: <br />
1. Set Variables <br />
2. Send Notification
<br /> <br />
Variables: <br />
* PushoverAppToken <br />
* PushoverUserToken <br />
* PushoverEmergencySound
<br /> <br />
Example: set(PushoverAppToken:'1abcd32345def...');
<br /> <br />
<h6>Usage:</h6>
PushoverSendNotification('String to Send'); <br />
PushoverSendNotification('String to Send', 0); //With priority param <br />
PushoverSendNotification('String to Send', 0, 'soundToPlay'); //With sound to play <br />
