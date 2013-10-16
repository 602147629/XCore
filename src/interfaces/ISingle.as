package interfaces
{
	public interface ISingle extends IDispose
	{
		function set appName(appName:String):void;
		
		function get appName():String;
	}
}