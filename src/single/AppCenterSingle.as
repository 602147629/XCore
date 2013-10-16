package single
{
	import flash.utils.Dictionary;
	
	import interfaces.IDispose;
	import interfaces.IManager;
	import interfaces.ISingle;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	/**
	 * 管理所有的应用程序
	 * @author cdr
	 * 
	 */	
	public class AppCenterSingle implements IDispose,ISingle
	{
		
		/**
		 * 添加各种管理器
		 * @param manager  管理器对象
		 */
		public function addManager(manager:IManager):IManager
		{
			_appName = manager.name;
			if(_dic[_appName])
				return _dic[_appName];
			return _dic[_appName] = manager;
		}
		
		/**
		 * 根据管理器名字 获得 管理器对象
		 * @param managerName 管理器名字 
		 * @return   管理器对象
		 * 
		 */
		public function getManagerByName(managerName:String):IManager
		{
			_appName = managerName;
			if(_dic[_appName])
				return _dic[_appName];
			else
				return null;
		}
		
		/**
		 * 根据管理器名字 删除  管理器对象
		 * @param managerName 管理器名字 
		 * 
		 */		
		public function removeManagerByName(managerName:String):void
		{
			_appName = managerName;
			if(!_dic.hasOwnProperty(_appName))
				throw new Error(ERROR_INFO);
			_dic[_appName] = null;
			delete _dic[_appName];
		}
		
		public function dispose():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function set appName(appName:String):void
		{
			// TODO Auto Generated method stub
			_appName = appName;
		}
		
		public function get appName():String
		{
			// TODO Auto Generated method stub
			return _appName;
		}
		
		public static function Instance():AppCenterSingle
		{
			if(!_instance)
				_instance = new AppCenterSingle;
			return _instance;
		}
		
		public function AppCenterSingle()
		{
			if(_instance)
				throw new Error(REPEAT);
		}
		
		private static var _instance:AppCenterSingle;
		private var _dic:Dictionary;
		
		private var _appName:String = "";
		
		public var ERROR_INFO:String = "不存在此管理器:"+_appName;
		public static const REPEAT:String =  "不能重复创建AppCenterSingle对象";
	}
}