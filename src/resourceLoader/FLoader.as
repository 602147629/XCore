package resourceLoader
{
	import debugger.Debugger;
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import interfaces.resourceVersion.IResourceVersionManager;
	
	import resourceVersion.ResourceVersionManager;
	
	/**
	 *  加载器，自动修正url地址，以及 context
	 * @author cdr
	 */	
	public class FLoader extends Loader
	{
		public static var resourceManager:IResourceVersionManager = ResourceVersionManager.getInstance();
		
		override public function load(request:URLRequest, context:LoaderContext=null):void
		{
			if (context == null)
			{
				context = new FLoaderContext(false, new ApplicationDomain(ApplicationDomain.currentDomain));
			}
			
			if (resourceManager != null)
				request.url = resourceManager.fix(request.url);
			super.load(request, context);
		}
		
		public function getPercent():Number
		{
			if (contentLoaderInfo.bytesTotal == 0)
				return 0;
			return contentLoaderInfo.bytesLoaded / contentLoaderInfo.bytesTotal;
		}
		
		public function getContent():DisplayObject
		{
			return content;
		}
		
		public function getDefinition(name:String):Object
		{
			return contentLoaderInfo.applicationDomain.getDefinition(name);
		}
		public function trace(...arg):void
		{
			Debugger.print(arg);
		}
	}
}