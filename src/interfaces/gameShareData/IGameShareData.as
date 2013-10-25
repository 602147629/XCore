package interfaces.gameShareData
{
	import interfaces.IDispose;
	
	import mx.resources.IResourceManager;
	
	public interface IGameShareData extends IDispose
	{
		/**
		 * 资源管理器 
		 * @return 
		 * 
		 */		
		function get resourceManager():IResourceManager;
		/**
		 * loading管理器 
		 * @return 
		 * 
		 */		
		//		function get loadingController():LoadingController;
		/**
		 * SWF参数 
		 * @return 
		 * 
		 */		
		function get swfParams():Object;
		/**
		 * 连接上服务后本地时间纪录 
		 * @return 
		 * 
		 */		
		function get loginLocalTime():Number;
		function get loginCDTime():Number;
	}
}