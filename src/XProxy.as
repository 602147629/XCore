package
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import interfaces.IDelegate;
	import interfaces.proxy.IProxy;
	
	import notification.AppNotification;
	
	/**
	 * MVC 的 M 层基类  
	 * @author cdr
	 * 
	 */	
	public class XProxy extends EventDispatcher implements IProxy
	{
		//name
		private var _name:String;
		//delegate
		private var _delegate:IDelegate;
		//app name
		private var _appName:String;
		
		public function XProxy(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function register(value:*):void
		{
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		/**
		 * 设置策略
		 * @param	value	IDelegate	策略
		 * @return	IDelegate	策略
		 */
		public function set delegate(value:IDelegate):void
		{
			_delegate = value;
		}
		
		public function get delegate():IDelegate
		{
			return _delegate;
		}
		
		public function createNotification():AppNotification
		{
			var note:AppNotification = new AppNotification;
			note.appName = appName;
			return note;
		}
		
		/**
		 * 封装发送通知 
		 * @param name
		 * @param data
		 * 
		 */		
		public function sendNotification(name:String, data:*):void
		{
			var note:AppNotification = this.createNotification();
			note.setType(name);
			note.setBody(data);
			note.dispatch();
		}
		
		public function set appName(value:String):void
		{
			_appName = value;
		}
		
		public function get appName():String
		{
			return _appName;
		}
		
		public function dispose():void
		{
		}
		
		public function init(manager:*):void
		{
		}
	}
}