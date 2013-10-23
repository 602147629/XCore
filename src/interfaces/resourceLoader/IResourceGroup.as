package interfaces.resourceLoader
{
	public interface IResourceGroup extends IResourceItem
	{
		function addResource(ir:IResource):void;
		
		function removeResource(ir:IResource):void;
		
		function completeGroup(irg:IResourceGroup):void;
		
		function loadNext():void;
	}
}