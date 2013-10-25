package interfaces.command
{
	public interface IAsyncMacroCommand extends IAsyncCommand
	{
		function addSubCommand(clazz:Class):void;
		function next():void;
		function cancelQueue():void;
	}
}