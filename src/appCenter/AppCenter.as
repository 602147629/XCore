package appCenter
{
	import error.AppCenterError;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	import interfaces.IDispose;
	import interfaces.IManager;
	
	public class AppCenter extends EventDispatcher implements IDispose
	{
		public function AppCenter()
		{
			super();
			this._managerMap = new Dictionary();
		}
		
		public function addManager(imanager:IManager):void
		{
			var nameStr:String=null;
			if (!(null == imanager.name) && !("" == imanager.name)) 
			{
				nameStr = imanager.name;
				this._managerMap[nameStr] = imanager;
			}
			else 
			{
				throw new AppCenterError(AppCenterError.NO_NAME_MANAGER);
			}
		}
		
		public function getManagerByName(managerName:String):IManager
		{
			var imanager:IManager=null;
			imanager = IManager(this._managerMap[managerName]);
			return imanager;
		}
		
		public function removeManagerByName(managerName:String):void
		{
			this._managerMap[managerName] = null;
			delete this._managerMap[managerName];
		}
		
		public function dispose():void
		{
			this._managerMap = null;
			this._alive = false;
		}
		
		public function get isAlive():Boolean
		{
			return this._alive;
		}
		
		private var _managerMap:Dictionary;
		
		private var _alive:Boolean=false;
	}
}