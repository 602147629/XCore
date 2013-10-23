package error
{
	public class AppNotificationError extends Error
	{
		public function AppNotificationError(message:*="", id:*=0)
		{
			super(message, id);
		}
		
		public static const NO_APPNAME:String="Please set the appName first.";
		
		public static const NO_USE_ASYNCH_NOTIFICATION:String="Please use the asynchNotification to invoke command, then can get the notification instance.Please check it first.";
	}
}