package error
{
	public class AppCenterError extends Error
	{
		public function AppCenterError(message:*="", id:*=0)
		{
			super(message, id);
		}
		
		public static const NO_NAME_MANAGER:String="Has no name of manager.Please set the manager\'s name first.";
	}
}