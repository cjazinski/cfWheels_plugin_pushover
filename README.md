<h1>cfWheels_plugin_pushover</h1>
<hr />

Author: Christopher Jazinski <br />
Version: 0.1a <br />
Last Modified: 01/27/2014 <br />
Description: This will allow you to integrate with the Pushover API to send messages
<br />
Installation: Install the plug as normal (follow cfwheels guide)<br />
PreReqs: You must define a few variables in the settings so the pushover plugin
knows your API and Application key. You can register your application (and obtain both keys) at pushover.net. ALSO YOU MUST HAVE A PUSHOVER ACCOUNT AND APP (ios/droid)
<br /> <br />
        <h2>How to use</h2>
        <ol>
                <li>Set Variables<li>
                <li>Send Notification</li>
        </ol>

        <h3>Variables</h3>
        <ul>
        <li>PushoverAppToken</li>
        <li>PushoverUserToken</li>
        <li>PushoverEmergencySound</li>
        </ul>
	** Example: set(PushoverAppToken:'1abcd32345def...'); //in settings
        ** Note The EmergencySound will be set if you do not set it **
