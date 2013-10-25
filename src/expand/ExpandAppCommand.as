package expand
{
	import interfaces.IDispose;
	import interfaces.IManager;
	import interfaces.notify.IExpandNotifyMethod;
	
	
	import org.puremvc.as3.interfaces.INotification;
	import command.AppCommand;

	public class ExpandAppCommand extends AppCommand implements IExpandNotifyMethod,IDispose
	{
		public function ExpandAppCommand()
		{
			super();
		}
		
		public function notify(type:String, data:*=null):ExpandAppNotification
		{
			var exAppNotify:ExpandAppNotification=this.createExtraNotification();
			exAppNotify.setType(type);
			exAppNotify.setBody(data);
			exAppNotify.dispatch();
			return exAppNotify;
		}
		
		public function createExtraNotification():ExpandAppNotification
		{
			var exAppNotify:ExpandAppNotification=new ExpandAppNotification();
			exAppNotify.appName = this.currentAppName;
			return exAppNotify;
		}
		
		public function set result(arg1:*):void
		{
			this._result = arg1;
		}
		
		public function get result():*
		{
			return this._result;
		}
		
		public function initAppCommand(iNotify:INotification):void
		{
			super.setAppName(iNotify);
		}
		
		public function getManager(managerName:String):IManager
		{
			var im:IManager=this.gameCenter.getManagerByName(managerName);
			return im;
		}
		
		public function dispose():void
		{
			this._result = null;
			return;
		}
		
		private var _result:*;
	}
}