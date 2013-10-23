package interfaces.resourceLoader
{
	public interface IResourceLoaderListener
	{
		function onResourceLoadComplete(iri:IResourceItem):void;
		
		function onResourceLoadError(iri:IResourceItem):void;
		
		function onResourceLoadProgress(progress:Number, iri:IResourceItem):void;
	}
}