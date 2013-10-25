package interfaces.controller
{
	import flash.display.DisplayObject;
	
	import interfaces.IThread;
	
	public interface IViewerController extends IThread
	{
		function set viewer(arg1:DisplayObject):void;
		
		function get viewer():DisplayObject;
	}
}