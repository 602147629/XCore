package interfaces.command
{
	import org.puremvc.as3.interfaces.ICommand;
	
	public interface IAsyncCommand extends ICommand
	{
		function initAsync(appName:String, p:IAsyncMacroCommand):void;
		
		function commandComplete():void;
	}
}