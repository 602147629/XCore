package single
{
	import flash.utils.Dictionary;
	
	import interfaces.IDispose;
	import interfaces.ISingle;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	/**
	 * 管理Facade对象
	 * @author cdr
	 * 
	 */	
	public class FacadeSingle implements IDispose,ISingle
	{
		
		/**
		 * 添加Facade 
		 * @param facadeName  facade名字 
		 * @param ifacade facade对象
		 * @return 创建facade对象
		 * 
		 */
		public function addFacadeByName(facadeName:String,ifacade:IFacade):Facade
		{
			_appName = facadeName;
			if(_dic[_appName])
				return _dic[_appName];
			return _dic[_appName] = ifacade;
		}
		
		/**
		 * 根据facade名字 获得 facade对象
		 * @param facadeName facade名字 
		 * @return   facade对象
		 * 
		 */
		public function getFacadeByName(facadeName:String):Facade
		{
			_appName = facadeName;
			if(_dic[_appName])
				return _dic[_appName];
			else
				return null;
		}
		
		/**
		 * 根据facade名字 删除  facade对象
		 * @param facadeName facade名字 
		 * 
		 */		
		public function removeFacadeByName(facadeName:String):void
		{
			_appName = facadeName;
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
		
		public static function Instance():FacadeSingle
		{
			if(!_instance)
				_instance = new FacadeSingle;
			return _instance;
		}
		
		public function FacadeSingle()
		{
			if(_instance)
				throw new Error(REPEAT);
		}
		
		private static var _instance:FacadeSingle;
		private var _dic:Dictionary;
		
		private var _appName:String = "";
		
		public var ERROR_INFO:String = "不存在此Facade:"+_appName;
		public static const REPEAT:String = "不能重复创建FacadeSingle对象";
	}
}