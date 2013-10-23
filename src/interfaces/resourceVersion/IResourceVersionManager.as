package interfaces.resourceVersion
{
	public interface IResourceVersionManager
	{
		function getMapResourceURL(str:String):String;
		
		function fix(str:String, argB:Boolean=false):String;
	}
}