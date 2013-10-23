package interfaces.resourceLoader
{
	import resourceLoader.LoadContext;

	public interface IResourceItem extends IResource
	{
		function startLoad(lc:LoadContext):void;
		
		function cancelLoad():void;
		
		function get loadPercent():Number;
		
		function setLoadParent(irg:IResourceGroup):void;
		
		function addLoadListener(irgl:IResourceLoaderListener, arg1:int=0):void;
		
		function removeLoadListener(irgl:IResourceLoaderListener):void;
	}
}