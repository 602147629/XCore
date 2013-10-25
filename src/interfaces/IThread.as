package interfaces
{
	import notification.AppNotification;

	public interface IThread extends ISingle
	{
		function createNotification():AppNotification;
	}
}