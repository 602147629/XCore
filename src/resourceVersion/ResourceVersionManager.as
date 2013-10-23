package resourceVersion
{
	import interfaces.resourceVersion.IResourceVersionManager;

	/**
	 * 资源版本控制
	 * @author cdr
	 *
	 */
	public class ResourceVersionManager implements IResourceVersionManager
	{
		private static var instance:ResourceVersionManager;
		private static const HTTP:String = "http://";
		public static var version:String = "2013.10.01";
		public static var resourceVersionXML:XML;

		public static function setVersion(v:String):void
		{
			version = v;
		}

		/**
		 * 单例模式
		 * @return
		 *
		 */
		public static function getInstance():ResourceVersionManager
		{
			return instance ||= new ResourceVersionManager(new Scope);
		}

		public function ResourceVersionManager(s:Scope)
		{
			if (s == null)
			{
				throw new Error("Please use ResourceVersionManager.getInstance() ");
			}
		}

//==================================================================================================
// Public
//==================================================================================================

		public function getMapResourceURL(url:String):String
		{
			return fix(url);
		}

		/**
		 * 获取UI配置路径
		 * @param uiName
		 * @param isBinary
		 * @return
		 *
		 */
		public function getUIConfigURL(uiName:String, isBinary:Boolean):String
		{
//			var url:String = "../resource/panelConfigs/" + uiName + (isBinary ? JJFSConstant.PACK_POSTFIX : ".xml");
			var url:String = "";
			return fix(url);
		}

		/**
		 * 获取UI图片路径
		 * @param resourceName
		 * @return
		 *
		 */
		public function getUISkinURL(resourceName:String):String
		{
			var index:int = resourceName.lastIndexOf("%");
			var name:String = resourceName.substr(0, index);
			var folder:String = resourceName.substr(index + 1, resourceName.length - (index + 1));
			var url:String = "../resource/default/ui/resource/" + folder + "/" + name;
			return fix(url);
		}

		/**
		 * 获取动画资源SWF文件的URL
		 * @param url
		 * @return
		 *
		 */
		public function getAnimateSWFURL(url:String):String
		{
			url = "../resource/default/animate2/swf/" + url;
			return fix(url);
		}

		/**
		 * 修正资源URL，检查版本
		 * @param path
		 * @param forceUpdate
		 * @return String 修正过的地址
		 *
		 */
		public function fix(path:String, forceUpdate:Boolean = false):String
		{
			//已修正的或是绝对路径了
			if (path.indexOf(HTTP) == 0)
				return path;
			
			var pathInfo:Array = path.split("?");
			path = pathInfo[0];
			//将\替换为/
			if (path.indexOf("\\") != -1)
				path = path.split("\\").join("/");
//			//将icon目录下png转swf的转一下地址
//			if (path.indexOf(".png") != -1 && path.indexOf("/icon/") != -1 && path.indexOf(".swf") == -1)
//			{
//				path = path.slice(0, path.length - 4);
//				path += ".swf";
//				
//				CONFIG::CONSOLE
//				{
//					logCh("PNG2SWF", path);
//				}
//			}
//			var cdn:String = GameConfiguration.CDN;
			var cdn:String = "";
			if (cdn != null)
				path = cdn + path;
			path += "?version=" + version;
			return path;
		}
	}
}

class Scope
{
}
