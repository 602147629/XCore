package resourceLoader
{
	
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	
	import interfaces.resourceLoader.IResourceGroup;
	import interfaces.resourceLoader.IResourceItem;
	import interfaces.resourceLoader.IResourceLoaderListener;
	
	import resourceVersion.ResourceVersionManager;
	
	public class SWFLoader implements IResourceItem
	{
		protected var fLoader:FLoader;
		private var _url:String;
		private var _listeners:Array = [];
		private var _context:LoadContext;
		private var _loaderContext:FLoaderContext;
		private var _percent:Number = 0;
		
		public function SWFLoader(url:String, context:FLoaderContext = null)
		{
			super();
			
			_url = url + "?version=" + ResourceVersionManager.version;
			_loaderContext = context;
		}
		
		public function get loader():FLoader
		{
			return fLoader;
		}
		
		public function startLoad(context:LoadContext):void
		{
			_context = context;
			_context.requestThread(this);
			
			if (_loaderContext == null)
				_loaderContext = new FLoaderContext(false, ApplicationDomain.currentDomain);
			
			fLoader = new FLoader;
			fLoader.load(new URLRequest(_url), _loaderContext);
			fLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			fLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			fLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
		}
		
		private function onProgress(event:ProgressEvent):void
		{
			_percent = event.bytesLoaded / event.bytesTotal;
			for each(var l:IResourceLoaderListener in _listeners)
			l.onResourceLoadProgress(_percent, this);
		}

		private function onIoError(event:IOErrorEvent):void
		{
			_percent = 1;
			_context.releaseThread(this);
			for each(var l:IResourceLoaderListener in _listeners)
			l.onResourceLoadError(this);
		}

		protected function onComplete(event:Event):void
		{
			_context.releaseThread(this);
			for each(var l:IResourceLoaderListener in _listeners)
				l.onResourceLoadComplete(this);
		}
		
		public function cancelLoad():void
		{
		}
		
		public function addLoadListener(l:IResourceLoaderListener, priority:int=0):void
		{
			_listeners.push(l);
		}
		
		public function removeLoadListener(l:IResourceLoaderListener):void
		{
		}

		public function get loadPercent():Number
		{
			return _percent;
		}


		public function setLoadParent(parent:IResourceGroup):void
		{
			//TODO Auto-generated method stub
		}

		public function onLoadResourceComplete():void
		{
			// TODO Auto-generated method stub
		}

	}
}