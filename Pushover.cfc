/**
* @author Christopher Jazinski
* @hint This will allow you to have pushover notifications sent
* @mixin controller
**/
component {

	public function init() {
		this.version = "1.1.8";
		return this;
	}
	
	public function PushoverSendNotification(required string message, priority = 0, sound = 'pushover') {
		var h = new http();
		
		$checkForAppAndUserTokens();
		
		h.setUrl('https://api.pushover.net/1/messages.xml');
		h.setMethod('POST');
		h.addParam(name:'token', value:get('PushoverAppToken'), type="URL");
		h.addParam(name:'user', value:get('PushoverUserToken'), type="URL");
		h.addParam(name:'message', value:arguments.message, type="URL");
		h.addParam(name:'priority', value:arguments.priority, type="URL");
		/*
		 * -1 = quite
		 *  0 = default
		 *  1 = high
		 *  2 = Emergency
		 */
		h.addParam(name:'sound', value:arguments.sound, type="URL");
		/*
		 * pushover - Pushover (default)
		 * bike - Bike
		 * bugle - Bugle
		 * cashregister - Cash Register
		 * classical - Classical
		 * cosmic - Cosmic
		 * falling - Falling
		 * gamelan - Gamelan
		 * incoming - Incoming
		 * intermission - Intermission
		 * magic - Magic
		 * mechanical - Mechanical
		 * pianobar - Piano Bar
		 * siren - Siren
		 * spacealarm - Space Alarm
		 * tugboat - Tug Boat
		 * alien - Alien Alarm (long)
		 * climb - Climb (long)
		 * persistent - Persistent (long)
		 * echo - Pushover Echo (long)
		 * updown - Up Down (long)
		 * none - None (silent)
		 */
		if (arguments.priority == 2) {
			h.addParam(name:'retry', value:'30', type:'URL');
			h.addParam(name:'expire', value:'3600', type:'URL');
			h.addParam(name:'title', value:'-= ERROR =-', type:'URL');
			h.addParam(name:'sound', value:get('PushoverEmergencySound'), type="URL");
		}
		
		rs = h.send().getPrefix();
		if (rs.responseheader.status_code != 200) {
			flashInsert(error:'Problem sending Pushover notifications');
			flashInsert(info:rs.fileContent);
		}
		
		return rs.fileContent;
		
		/*
		device - your user's device name to send the message directly to that device, rather than all of the user's devices
		title - your message's title, otherwise your app's name is used
		url - a supplementary URL to show with your message
		url_title - a title for your supplementary URL, otherwise just the URL is shown
		timestamp - a Unix timestamp of your message's date and time to display to the user, rather than the time your message is received by our API
		*/
		
		
	}
	
	//Used to check the settings
	public function $checkForAppAndUserTokens() {
		try {
			get('PushoverAppToken');
		}
		catch (any e) {
			flashInsert(error:'PushoverAppToken is not defined in settings');
			redirectTo(action:'index');
		}
		try {
			get('PushoverUserToken');
		}
		catch (any e) {
			flashInsert(error:'PushoverUserToken is not defined in settings');
			redirectTo(action:'index');
		}
		//Lets look for the default emergencysound
		try {get('PushoverEmergencySound');}
		catch (any e) {
			set(PushoverEmergencySound:'alien');
			flashInsert(info:'Default Emergency tone has been set. to change it configure the PushoverEmergencySound variable.');
		}
	}
	
}
