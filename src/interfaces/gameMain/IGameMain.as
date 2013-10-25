package interfaces.gameMain
{
	import interfaces.gameModule.IGameModule;
	import interfaces.gameShareData.IGameShareData;
	
	public interface IGameMain extends IGameModule
	{
		function initMap(shareData:IGameShareData):void
	}
}