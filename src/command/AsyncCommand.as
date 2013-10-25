package command
{
	import expand.ExpandAppCommand;
	
	import interfaces.command.IAsyncCommand;
	import interfaces.command.IAsyncMacroCommand;
	import expand.ExpandAppCommand;

	/**
	 * @author cdr
	 */	
	public class AsyncCommand extends ExpandAppCommand implements IAsyncCommand
	{
		protected var parent:IAsyncMacroCommand;
		
		public function AsyncCommand()
		{
			super();
		}
		
		public function initAsync(appName:String, parent:IAsyncMacroCommand):void
		{
			this.currentAppName = appName;
			this.parent = parent;
		}

		public function commandComplete():void
		{
			if (parent != null)
				parent.next();
		}
	}
}