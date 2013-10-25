package command
{
	import appCenter.AppCenter;
	
	import error.AppCommandError;
	
	import facade.ExpandAppFacade;
	
	import notification.AppNotification;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	import single.AppCenterSingle;
	import single.ApplicationSingle;
	import single.FacadeSingle;
	
	public class AppCommand extends SimpleCommand
	{
		public function AppCommand()
		{
			super();
		}
		
		override public function execute(iNotify:INotification):void
		{
			super.execute(iNotify);
			this.setAppName(iNotify);
		}
		
		protected function setAppName(iNotify:INotification):void
		{
			var appName:String= AppNotification(iNotify).appName;
			this.currentAppName = appName;
		}
		
		protected function createNotification():AppNotification
		{
			var appNotify:AppNotification=new AppNotification();
			appNotify.appName = this.currentAppName;
			return appNotify;
		}
		
		public function get expandFacade():ExpandAppFacade
		{
			if ("" == this.currentAppName || null == this.currentAppName) 
			{
				throw new AppCommandError(AppCommandError.INIT_ERROR_NO_APPNAME);
			}
			if (null == this._facade) 
			{
				this._facade = FacadeSingle.Instance().getFacadeByName(this.currentAppName);
			}
			return this._facade;
		}
		
		public function get gameCenter():AppCenter
		{
			if ("" == this.currentAppName || null == this.currentAppName) 
			{
				throw new AppCommandError(AppCommandError.INIT_ERROR_NO_APPNAME);
			}
			if (null == this._gameCenter) 
			{
				this._gameCenter = ApplicationSingle.Instance().getAppCenterByName(this.currentAppName);
			}
			return this._gameCenter;
		}
		
		private var _facade:ExpandAppFacade;
		
		private var _gameCenter:AppCenter;
		
		protected var currentAppName:String="";
	}
}