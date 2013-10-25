package interfaces.controller
{
	import contrller.ContrllerInfo;

	public interface IBasicViewerController extends IViewerController
	{
		function set ctrlType(value:String):void;
		
		function get ctrlType():String;
		/**
		 *指定所在层 
		 * @param value
		 * 
		 */		
		function set ctrlLayer(value:String):void;
		/**
		 *指定所在层 
		 * @return 
		 * 
		 */		
		function get ctrlLayer():String;
		
		function getCoexistCtrTypeList():Array;
		
		function getChildCtrType():Array;
		/**
		 * Contrller 附加信息 
		 * @return 
		 * 
		 */		
		function get ctrlInfo():ContrllerInfo;
	}
}