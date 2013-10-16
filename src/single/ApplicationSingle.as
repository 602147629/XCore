package single
{
	import flash.utils.Dictionary;
	
	import interfaces.IDispose;
	import interfaces.ISingle;
	
	import org.puremvc.as3.interfaces.IFacade;
	
	/**
	 * 应用程序中心管理
	 * @author cdr
	 * 
	 */	
	public class ApplicationSingle implements IDispose,ISingle
	{
		
		/**
		 * 添加应用程序中心
		 * @param appName  应用程序名称
		 */
		public function addAppCenter(appName:String):AppCenterSingle
		{
			_appName = appName;
			if(_dic[_appName])
				return _dic[_appName];
			return _dic[_appName] = AppCenterSingle.Instance();
		}
		
		
		/**
		 * 根据应用程序中心名字 获得 应用程序中心
		 * @param appName 应用程序名称
		 * @return    管理器对象
		 * 
		 */
		public function getAppCenterByName(appName:String):AppCenterSingle
		{
			_appName = appName;
			if(_dic[_appName])
				return _dic[_appName];
			else
				return null;
		}
		
		/**
		 * 根据application名字 删除  application对象
		 * @param appName application名字 
		 * 
		 */		
		public function removeAppCenterByName(appName:String):void
		{
			_appName = appName;
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
		
		
		
		public static function Instance():ApplicationSingle
		{
			if(!_instance)
				_instance = new ApplicationSingle;
			return _instance;
		}
		
		public function ApplicationSingle()
		{
			if(_instance)
				throw new Error(REPEAT);
		}
		
		private static var _instance:ApplicationSingle;
		private var _dic:Dictionary;
		
		private var _appName:String = "";
		
		
		public var ERROR_INFO:String = "不存在此应用程序中心:"+_appName;
		public static const REPEAT:String =  "不能重复创建ApplicationSingle对象";
	}
}