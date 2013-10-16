package
{
	import flash.display.DisplayObject;
	
	import interfaces.IDispose;
	import interfaces.IManager;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	import single.AppCenterSingle;
	import single.ApplicationSingle;
	import single.FacadeSingle;

	/**
	 * 应用程序初始化操作
	 * @author cdr
	 * 
	 */	
	public class ApplicationInit implements IDispose
	{
		
		
		public function init(appName:String,stage:DisplayObject):void
		{
			this._appName = appName;
			this._stage = stage;
			this._appCenter = ApplicationSingle.Instance().addAppCenter(this._appName);
			
			_facade = new ExpandAppFacade;
			_facade.appName = appName;
			FacadeSingle.Instance().addFacadeByName(_facade.appName,_facade);
			
			construct();
		}
		
		public function construct():void
		{
			
		}
		
		/**
		 * 添加各种管理器
		 * @param manager  管理器对象
		 */
		public function addManager(manager:IManager):void
		{
			ApplicationSingle.Instance().addAppCenter(manager.name).addManager(manager);
		}
		
		/**
		 * 根据管理器名字 删除  管理器对象
		 * @param managerName 管理器名字 
		 * 
		 */		
		public function removeManager(manager:IManager):void
		{
			ApplicationSingle.Instance().addAppCenter(manager.name).removeManagerByName(manager.name);
		}
		
		
		public function dispose():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public static function Instance():ApplicationInit
		{
			if(!_instance)
				_instance = new ApplicationInit;
			return _instance;
		}

		public function get facade():ExpandAppFacade
		{
			return _facade;
		}

		public function set facade(value:ExpandAppFacade):void
		{
			_facade = value;
		}

		
		public function ApplicationInit()
		{
			if(_instance)
				throw new Error(REPEAT);
		}
		
		private static var _instance:ApplicationInit;
		
		/**
		 * 应用程序名称 
		 */		
		private var _appName:String;
		private var _stage:DisplayObject;
		/**
		 * 所有应用程序 
		 */
		private var _appCenter:AppCenterSingle;
		private var _facade:ExpandAppFacade;
		
		public static const REPEAT:String = "不能重复创建ApplicationInit对象";
		
	}
}