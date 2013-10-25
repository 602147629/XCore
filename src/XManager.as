package
{
	import debugger.Debugger;
	
	import expand.ExpandAppNotification;
	import expand.ExpandManager;
	
	import gameContext.GameContext;
	
	import tracker.CommandTracker;
	
	public class XManager extends ExpandManager
	{
		public function XManager()
		{
			super();
		}
		
		
		/**
		 * 通知
		 * @param 		type					命令类型
		 * @param 		data					参数
		 * @return 		ExpandAppNotification	返回通知实例
		 */
		override public function notify(type:String, data:* = null):ExpandAppNotification
		{
			var note:ExpandAppNotification = new ExpandAppNotification(type, data);
			note.appName = this.appName;
			CommandTracker.track(this, note);
			note.dispatch();
			return note;
		}
		
		/**
		 * 游戏数据中心.
		 * @return
		 *
		 */
		public function get gameContext():GameContext
		{
			return GameContext.getInstance();
		}
		public function trace(...arg):void
		{
			Debugger.print(arg);
		}
	}
}