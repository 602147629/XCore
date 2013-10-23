package interfaces
{
	public interface IManager extends IThread
	{
		function register(arg1:*):void;
		
		function set name(name:String):void;
		function get name():String;
		
		function set delegate(idelegate:IDelegate):void;
		function get delegate():IDelegate;
	}
}