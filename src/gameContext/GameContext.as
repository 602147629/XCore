package gameContext
{
	import flash.events.Event;
	import flash.net.SharedObject;
	import flash.utils.getTimer;
	
	import interfaces.gameContext.IGameContext;
	import interfaces.gameShareData.IGameShareData;
	
	public class GameContext extends XManager implements IGameContext
	{
		private static var instance:GameContext = new GameContext;
		/**
		 * 请求心跳包的次数，超过三次视为断线
		 */
		public var pingRequestNum:int;
		
		private var _gameReady:Boolean;
//		private var _characterModel:CharacterModel;
		private var _serverTime:int;
		private var _getServerTime:int;
		
		public function GameContext()
		{
			if (instance != null)
				throw "Error!";
		}
		/**
		 *获得服务器时间，单位是秒。 
		 * @return 
		 * 
		 */		
		public function get serverTime():int
		{
			
			return _serverTime + (getTimer() - _getServerTime)/1000;
		}
		
		public function set serverTime(value:int):void
		{
			_getServerTime = getTimer();
			_serverTime = value;
		}
		
		public static function getInstance():GameContext
		{
			return instance;
		}
		public function init(shareData:IGameShareData/*, charModel:CharacterModel*/):void
		{
				
		}
		
		
//		/**
//		 * 声音管理器
//		 * return
//		 */
//		public function get soundManager():SoundManager
//		{
//			if(_soundManager == null)
//				_soundManager = new SoundManager;
//			return _soundManager;
//		}
		
		
		/**
		 * 游戏是否已就绪
		 * @return
		 *
		 */
		public function get gameReady():Boolean
		{
			return _gameReady;
		}
		
		public function get sharedObject():SharedObject
		{
			return _sharedObject;
		}
		
		private var _sharedObject:SharedObject;
		public function set gameReady(value:Boolean):void
		{
			_gameReady = value;
			
//			if(/*isNewbie() &&*/ true)
//			{
//				this.soundManager.add(new URLSoundItems("LoginIn.mp3"))
//			}
			
			/**
			this.dispatchEvent(new GameEvent(GameEvent.GAME_READY));
			_sharedObject = SharedObject.getLocal("soundVolume");
			var _volume:int = _sharedObject.data.volume;
			_sharedObject.data.volume = _volume = 1;
//			this.soundManager.setGlobalVolume(_volume);
			resourceManager.addEventListener(Event.OPEN, onResourceManagerStart);
			resourceManager.addEventListener(Event.COMPLETE, onResourceManagerComplete);
			resourceManager.startBackDownload();
			 * */
		}
		
		private function onResourceManagerComplete(event:Event):void
		{			
//			this.notify(CommandLoadingType.CLOSE_LOADING);
		}
		
		private function onResourceManagerStart(event:Event):void
		{
//			var loadingData:ObjShowLoading = new ObjShowLoading;
//			this.notify(CommandLoadingType.SHOW_LOADING, loadingData);
		}
		
//		public final function get resourceManager():ResourceManager
//		{
//			return ResourceManager.getInstance();
//		}
		
		/**
		 * 游戏加载进度统计集合，在 gameReady = true 之前调用addSubLoading
		 * @see com.ultizen.game.shell.utils.StartupLoadingCollection
		 * @return 
		 *
		 */
//		public function get startupLoadingCollection():StartupLoadingCollection
//		{
//			return StartupLoadingCollection.getInstance();
//		}		
//		public function get characterModel():CharacterModel
//		{
//			return _characterModel;
//		}
	}
}