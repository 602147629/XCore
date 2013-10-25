package interfaces.notify
{
	import expand.ExpandAppNotification;

	public interface IExpandNotifyMethod
	{
		function notify(arg1:String, arg2:*=null):ExpandAppNotification;
	}
}