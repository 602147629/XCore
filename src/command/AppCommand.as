package command
{
	import error.AppCommandError;
	
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
		
		public override function execute(iNotify:INotification):void
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
		
		public function get appfacade():Facade
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
		
		public function get gameCenter():AppCenterSingle
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
		
		private var _facade:Facade;
		
		private var _gameCenter:AppCenterSingle;
		
		protected var currentAppName:String="";
	}
}