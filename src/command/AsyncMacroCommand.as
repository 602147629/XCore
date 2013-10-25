package command
{
	import command.AsyncCommand;
	
	import interfaces.command.IAsyncCommand;
	import interfaces.command.IAsyncMacroCommand;
	
	import notification.AppNotification;
	
	import org.puremvc.as3.interfaces.INotification;

	/**
	 * @author cdr
	 */	
	public class AsyncMacroCommand extends AsyncCommand implements IAsyncMacroCommand
	{
		private var _list:Vector.<Class> = new Vector.<Class>();
		protected var note:INotification;
		
		public function AsyncMacroCommand()
		{
			super();
		}
		
		override public function execute(note:INotification):void
		{
			this.note = note;
			this.next();
		}
		
		public function addSubCommand(clazz:Class):void
		{
			_list.push(clazz);
		}
		
		public function next():void
		{
			if (_list.length > 0)
			{
				var clazz:Class = _list.shift();
				var subCmd:IAsyncCommand = new clazz();
				subCmd.initAsync(AppNotification(note).appName, this);
				subCmd.execute(note);
			}
			else
				this.commandComplete();
		}
		
		public function cancelQueue():void
		{
			_list = null;
			this.commandComplete();
		}
	}
}