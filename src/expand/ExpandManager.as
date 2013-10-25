package expand
{
	import interfaces.notify.IExpandNotifyMethod;
	
	import manager.Manager;
	
	
	public class ExpandManager extends Manager implements IExpandNotifyMethod
	{
		public function ExpandManager()
		{
			super();
		}
		
		public function createExtraNotification():ExpandAppNotification
		{
			var expAppnotify:ExpandAppNotification=new ExpandAppNotification();
			expAppnotify.appName = this.appName;
			return expAppnotify;
		}
		
		public function notify(arg1:String, arg2:*=null):ExpandAppNotification
		{
			var expAppnotify:ExpandAppNotification=this.createExtraNotification();
			expAppnotify.setType(arg1);
			expAppnotify.setBody(arg2);
			expAppnotify.dispatch();
			return expAppnotify;
		}
	}
}