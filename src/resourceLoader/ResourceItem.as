package resourceLoader
{
	import interfaces.resourceLoader.IResourceGroup;
	import interfaces.resourceLoader.IResourceItem;
	import interfaces.resourceLoader.IResourceLoaderListener;
	
	public class ResourceItem implements IResourceItem
	{
		public function ResourceItem(iri:IResourceItem=null)
		{
			this.listeners = [];
			super();
			this._host = iri || this;
		}
		
		public function cancelLoad():void
		{
			
		}
		
		public function get loadPercent():Number
		{
			return 0;
		}
		
		protected function complete():void
		{
			var irll:IResourceLoaderListener=null;
			var arr:Array=this.listeners;
			for each (irll in arr) 
			{
				irll.onResourceLoadComplete(this._host);
			}
			return;
		}
		
		protected function onError():void
		{
			var irll:IResourceLoaderListener=null;
			var arr:Array=this.listeners;
			for each (irll in arr) 
			{
				irll.onResourceLoadError(this._host);
			}
		}
		
		public function setLoadParent(irg:IResourceGroup):void
		{
			if (this.parent != null) 
			{
				this.parent.removeResource(this);
			}
			this.parent = irg;
		}
		
		public function addLoadListener(irll:IResourceLoaderListener, arg2:int=0):void
		{
			if (this.listeners.indexOf(irll) == -1) 
			{
				this.listeners.push(irll);
			}
		}
		
		public function removeLoadListener(irll:IResourceLoaderListener):void
		{
			var loc1:*=this.listeners.indexOf(irll);
			if (loc1 != -1) 
			{
				this.listeners.splice(loc1, 1);
			}
		}
		
		public function onLoadResourceComplete():void
		{
			return;
		}
		
		public function startLoad(lc:LoadContext):void
		{
			this.context = lc;
		}
		
		protected var listeners:Array;
		
		protected var parent:IResourceGroup;
		
		protected var context:LoadContext;
		
		private var _host:IResourceItem;
	}
}