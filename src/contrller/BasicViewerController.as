package contrller
{
	import debugger.Debugger;
	
	import expand.ExpandAppNotification;
	
	import flash.display.DisplayObject;
	
	import interfaces.controller.IBasicViewerController;
	import interfaces.notify.IExpandNotifyMethod;
	
	import notification.AppNotification;
	
	import tracker.CommandTracker;
	
	public class BasicViewerController implements IBasicViewerController, IExpandNotifyMethod
	{
		private var _appName:String;
		private var _container:DisplayObject;
		private var _ctrlInfo:ContrllerInfo = new ContrllerInfo;
		/**
		 * 用来检测客户端程序有没有正确调用 super.dispose(); 
		 */		
		private var _isDisposed:Boolean;
		
		public function BasicViewerController()
		{
			onRegister();
		}
		
		public function get appName():String
		{
			return this._appName;
		}
		
		
		/**
		 * 程序线名称
		 */
		public function set appName(value:String):void
		{
			this._appName = value;
		}
		
		/**
		 * 废弃的制作通知方法
		 */
		public function createNotification():AppNotification
		{
			var note:AppNotification = new AppNotification;
			note.appName = appName;
			return note;
		}
		
		public function get ctrlInfo():ContrllerInfo
		{
			return _ctrlInfo;
		}
		
		public function set ctrlLayer(value:String):void
		{
			_ctrlInfo.layer = value;
		}
		
		/**
		 * 指定所在的层
		 * @return
		 *
		 */
		public function get ctrlLayer():String
		{
			return _ctrlInfo.layer;
		}
		
		public function get ctrlType():String
		{
			return _ctrlInfo.type;
		}
		
		
		public function set ctrlType(value:String):void
		{
			_ctrlInfo.type = value;
		}
		
		public function getCoexistCtrTypeList():Array
		{
			return null;
		}
		
		public function getChildCtrType():Array
		{
			return null;
		}
		
		/**
		 * 释放内存
		 */
		public function dispose():void
		{
			_isDisposed = true;
			if(_container && _container.hasOwnProperty("dispose"))
			{
				_container["dispose"]();
			}
			_container = null;
		}
		
		CONFIG::DEBUG
		public function checkDispose():void
		{
			if (!_isDisposed)
				throw new Error("please use dipose() method!");
		}
		//==================================================================================================
		// Public Function
		//==================================================================================================
		/**
		 * 通知
		 * @param 		type					命令类型
		 * @param 		data					参数
		 * @return 		ExtraAppNotification	返回通知实例
		 */
		public function notify(type:String, data:* = null):ExpandAppNotification
		{
			var note:ExpandAppNotification = new ExpandAppNotification(type, data);
			note.appName = this.appName;
			CommandTracker.track(this, note);
			note.dispatch();
			return note;
		}
		
		public function get viewer():DisplayObject
		{
			return _container;
		}
		
		/**
		 * 用户交互面板总容器
		 */
		public function set viewer(viewer:DisplayObject):void
		{
			this._container = viewer;
		}
		
		protected function onRegister():void
		{
			
		}
		public function trace(...arg):void
		{
			Debugger.print(arg);
		}
	}
}