package error
{
	public class AppCommandError extends Error
	{
		public function AppCommandError(message:*="", id:*=0)
		{
			super(message, id);
		}
		
		public static const NOT_APPCOMMAND:String="Please use AppCommand class as the instance for notify.Or, please set appName first!";
		
		public static const INIT_ERROR_NO_APPNAME:String="初始化错误，错误的AppName";
	}
}