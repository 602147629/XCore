package interfaces.toolTip
{
	import flash.display.DisplayObjectContainer;

	public interface IToolTipSkin
	{
		function setTipData(arg1:IToolTipData):void;
		
		function setTarget(arg1:*):void;
		
		function show(arg1:DisplayObjectContainer):void;
		
		function hide(arg1:DisplayObjectContainer):void;
		
		function updatePosition(arg1:DisplayObjectContainer):void;
	}
}