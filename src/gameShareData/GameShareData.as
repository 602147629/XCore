package gameShareData
{
	import interfaces.gameShareData.IGameShareData;
	
	import mx.resources.IResourceManager;
	
	public class GameShareData implements IGameShareData
	{
		private static var instance:GameShareData;
		
		public static function getInstance():GameShareData
		{
			return instance ||= new GameShareData;
		}
		
		private var _resourceManager:IResourceManager;
//		private var _loadingController:LoadingController;
		private var _swfParams:Object;
		private var _loginLocalTime:Number;
		private var _loginCDTime:Number;
		private var _character:Object;//CHARACTERBASEINFO;
		private var _characterOther:Object;//CHARACTER_OTHER_INFO;
		
		public function get resourceManager():IResourceManager
		{
			return _resourceManager;
		}
		
		public function set resourceManager(value:IResourceManager):void
		{
			_resourceManager = value;
		}
		
//		public function get loadingController():LoadingController
//		{
//			return _loadingController;
//		}
//		
//		public function set loadingController(value:LoadingController):void
//		{
//			_loadingController = value;
//		}
		
		public function get swfParams():Object
		{
			return _swfParams;
		}
		
		public function set swfParams(value:Object):void
		{
			_swfParams = value;
		}
		
		public function get loginLocalTime():Number
		{
			return _loginLocalTime;
		}
		
		public function set loginLocalTime(value:Number):void
		{
			_loginLocalTime = value;
		}
		
		public function get loginCDTime():Number
		{
			return _loginCDTime;
		}
		
		public function set loginCDTime(value:Number):void
		{
			_loginCDTime = value;
		}
		public function dispose():void
		{
//			_loadingController = null;
		}
		
		public function get character():Object
		{
			return _character;
		}
		
		public function set character(value:Object):void
		{
			_character = value;
		}
		
		public function get characterOther():Object
		{
			return _characterOther;
		}
		
		public function set characterOther(value:Object):void
		{
			_characterOther = value;
		}
	}
}