package application
{
	import interfaces.IManager;
	import interfaces.proxy.IProxy;

	public class ApplicationInitProxy
	{
		private var _app:ApplicationInit;
		
		public function ApplicationInitProxy(app:ApplicationInit)
		{
			_app = app;
			initialize();
		}
		
		public function initialize():void
		{
			//连接
//			var connectionManager:ConnectionManager = new ConnectionManager();
//			var delegate:IDelegate = new ConnectionManagerDelegate();
//			connectionManager.delegate = delegate;
//			this.addManager(connectionManager, AppManagerConst.CONNECTION);
			//ctrl管理
//			var ctrlManager:ViewerControllerManager = new ViewerControllerManager(_app.stage as GameShell);
//			this.addManager(ctrlManager, ViewerControllerManager.VIEWER_MANAGER);
//			
//			//错误信息管理
//			this.addProxy(ErrorMsgManager.getInstance(), ModelConst.ERROR_MSG);
		}
		
		private function addManager(m:IManager, type:String):void
		{
//			m.appName = _app.appName;
//			m.name = type;
//			_app.addManager(m);
		}
		
		protected function addProxy(proxy:IProxy, name:String):void
		{
//			proxy.name = name;
//			proxy.appName = _app.appName;
//			_app.center.addManager(proxy);
		}
	}
}