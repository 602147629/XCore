package manager
{
	import interfaces.IDelegate;
	import interfaces.IManager;
	import notification.AppNotification;
	
	public class Manager implements IManager
	{
		public function Manager()
		{
		}
		
		public function register(arg1:*):void
		{
		}
		
		public function set name(name:String):void
		{
			this._name = name;
		}
		
		public function get name():String
		{
			return this._name;
		}
		
		public function set delegate(idelegate:IDelegate):void
		{
			this._delegate = idelegate;
		}
		
		public function get delegate():IDelegate
		{
			return this._delegate;
		}
		
		public function createNotification():AppNotification
		{
			var appNotify:AppNotification= new AppNotification(name);
			appNotify.appName = this.appName;
			return appNotify;
		}
		
		public function set appName(appName:String):void
		{
			this._appName = appName;
		}
		
		public function get appName():String
		{
			return this._appName;
		}
		
		public function dispose():void
		{
			this._appName = null;
			this._name = null;
			this._delegate = null;
		}
		
		protected var _appName:String;
		
		protected var _name:String;
		
		protected var _delegate:IDelegate;
	}
}