package error
{
	public class FacadeError extends Error
	{
		public function FacadeError(message:*="", id:*=0)
		{
			super(message, id);
		}
		
		
		
		public static const NOT_EXSIT_COMMAND:String="Can\'t find the current Command.";
		
		public static const NOT_CORRECT_COMMAND:String="Type or command is not available.";
	}
}