package interfaces.gameModule
{
	import application.ApplicationInit;
	
	import flash.events.IEventDispatcher;
	
	import interfaces.gameShareData.IGameShareData;
	
	public interface IGameModule extends IEventDispatcher
	{
		/**
		 * 初始化MVC框架 
		 * @param app GameShell中已经实例化好的 ApplicationInitialization 对象
		 * @param data 从FSWD2Shell中传过来的共用的一些数据
		 */		
		function initFramework(app:ApplicationInit, data:IGameShareData):void;
	}
}