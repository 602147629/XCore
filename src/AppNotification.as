package
{
	import error.AppNotificationError;
	
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;
	
	import single.FacadeSingle;
	
	public class AppNotification extends Notification
	{
		public function AppNotification(name:String=null, body:Object=null, type:String=null)
		{
			super(name, body, type);
		}
		
		
		public function set appName(appName:String):void
		{
			this._applicationName = appName;
		}
		
		public function get appName():String
		{
			return this._applicationName;
		}
		
		public function dispatch():void
		{
			var exAppFacade:Facade=null;
			if ("" == this.appName || null == this.appName) 
			{
				throw new AppNotificationError(AppNotificationError.NO_APPNAME);
			}
			exAppFacade = FacadeSingle.Instance().getFacadeByName(this.appName);
			exAppFacade.executeCommand(this);
		}
		
		private var _applicationName:String="";
	}
}