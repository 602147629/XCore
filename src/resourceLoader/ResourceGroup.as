package resourceLoader
{
	import flash.utils.Dictionary;
	
	import interfaces.resourceLoader.IResource;
	import interfaces.resourceLoader.IResourceGroup;
	import interfaces.resourceLoader.IResourceItem;
	import interfaces.resourceLoader.IResourceLoaderListener;
	import interfaces.resourceLoader.IResourceProxy;
	
	public class ResourceGroup extends ResourceItem implements IResourceGroup,IResourceLoaderListener
	{
		public function ResourceGroup(irg:IResourceGroup=null)
		{
			this._queue = [];
			this._loadQueue = [];
			this._completeQueue = [];
			this._nonCompleteGroup = [];
			this._proxyRes = [];
			this._hashMap = new flash.utils.Dictionary();
			this._host = irg || this;
			super(this._host);
		}
		
		public function addResourceAt(ir:IResource, length:int):void
		{
			var irp:IResourceProxy=null;
			this._isComplete = false;
			if (ir is IResourceItem) 
			{
				IResourceItem(ir).setLoadParent(this._host);
				if (this._queue.indexOf(ir) == -1) 
				{
					this._queue.push(ir);
				}
			}
			else if (ir is IResourceProxy)
			{
				this.addProxy(IResourceProxy(ir).resourceItem, irp, length);
			}
		}
		
		public function get isComplete():Boolean
		{
			return this._isComplete;
		}
		
		public function addResource(ir:IResource):void
		{
			this.addResourceAt(ir, this._queue.length);
		}
		
		private function addProxy(ir:IResource, irp:IResourceProxy, length:int):void
		{
			var iresPro:IResourceProxy;
//			this._hashMap[irp] = iresPro = this._hashMap[irp] || [];
//			var loc1:*=iresPro;
//			loc1.push(ir);
			if (ir is IResourceItem) 
			{
				this._hashMap[ir] = irp;
				this.addResourceAt(ir, length);
			}
			else 
			{
				this.addProxy(IResourceProxy(ir).resourceItem, irp, length);
			}
		}
		
		public function removeResource(ir:IResource):void
		{
			var locIndex:int=this._queue.indexOf(ir);
			if (locIndex != -1) 
			{
				this._queue.splice(locIndex, 1);
			}
			locIndex = this._loadQueue.indexOf(ir);
			if (locIndex != -1) 
			{
				this._loadQueue.splice(locIndex, 1);
				this.loadNext();
			}
			if (ir is IResourceItem) 
			{
				IResourceItem(ir).removeLoadListener(this);
			}
		}
		
		public function clear():void
		{
			this._queue = [];
			this._loadQueue = [];
			this._nonCompleteGroup = [];
			this._completeQueue = [];
			this._hashMap = new Dictionary();
		}
		
		public function onResourceLoadComplete(ir:IResourceItem):void
		{
			this.doProcess();
			ir.removeLoadListener(this);
			var index:int=this._loadQueue.indexOf(ir);
			this._loadQueue.splice(index, 1);
			if (this._hashMap[ir]) 
			{
				this._completeQueue.push(this._hashMap[ir]);
			}
			else 
			{
				this._completeQueue.push(ir);
			}
			if (ir is IResourceGroup) 
			{
				this.completeGroup(ir as IResourceGroup);
			}
			this._host.loadNext();
		}
		
		public function onResourceLoadError(ir:IResourceItem):void
		{
			this.onResourceLoadComplete(ir);
		}
		
		public function onResourceLoadProgress(progress:Number, ir:IResourceItem):void
		{
			this.doProcess();
		}
		
		public function completeGroup(irg:IResourceGroup):void
		{
			var index:int=this._nonCompleteGroup.indexOf(irg);
			if (index != -1) 
			{
				this._nonCompleteGroup.splice(index, 1);
			}
			index = this._loadQueue.indexOf(irg);
			if (index != -1) 
			{
				this._loadQueue.splice(index, 1);
			}
		}
		
		public override function onLoadResourceComplete():void
		{
			var irp:IResourceProxy=null;
			this._isComplete = true;
			super.onLoadResourceComplete();
			var arr:Array=this._completeQueue;
			for each (irp in arr) 
			{
				irp.onLoadResourceComplete();
			}
		}
		
		private function doProcess():void
		{
			var irll:IResourceLoaderListener=null;
			var arr:Array=listeners;
			for each (irll in arr) 
			{
				irll.onResourceLoadProgress(this.loadPercent, this);
			}
		}
		
		protected override function complete():void
		{
			this._isComplete = true;
			super.complete();
		}
		
		public override function startLoad(lc:LoadContext):void
		{
			super.startLoad(lc);
			this._host.loadNext();
		}
		
		public function loadNext():void
		{
			var irg:IResourceGroup=null;
			var irg2:IResourceGroup=null;
			var irg3:IResourceGroup=null;
			while (context.maxThread > 0 && this._nonCompleteGroup.length) 
			{
				irg = this._nonCompleteGroup.shift();
				irg.loadNext();
			}
			while (context.maxThread > 0 && this._queue.length) 
			{
				irg2 = this._queue.shift();
				irg2.addLoadListener(this);
				this._loadQueue.push(irg2);
				if (irg2 is IResourceGroup)
				{
					irg3 = irg2 as IResourceGroup;
					this._nonCompleteGroup.push(irg3);
				}
				irg2.startLoad(context);
			}
			if (this._queue.length == 0) 
			{
				if (this._loadQueue.length + this._queue.length != 0) 
				{
					if (parent) 
					{
						parent.loadNext();
					}
				}
				else 
				{
					this.complete();
				}
			}
		}
		
		public override function get loadPercent():Number
		{
			var locIRG:IResourceGroup=null;
			var locIRG2:IResourceGroup=null;
			var locLength:int=this._completeQueue.length + this._queue.length;
			var locLength2:int=this._completeQueue.length;
			var locNumber:Number=0;
			locLength = locLength + this._nonCompleteGroup.length;
			var loc6:*=0;
			var locArr:Array=this._nonCompleteGroup;
			for each (locIRG in locArr) 
			{
				locNumber = locIRG.loadPercent;
				if (isNaN(locNumber)) 
				{
					throw new Error("error!");
				}
				locLength2 = locLength2 + locNumber;
			}
			locLength = locLength + this._loadQueue.length;
			locArr = this._loadQueue;
			for each (locIRG2 in locArr) 
			{
				locNumber = locIRG2.loadPercent;
				if (isNaN(locNumber)) 
				{
					throw new Error("error!");
				}
				locLength2 = locLength2 + locNumber;
			}
			return locLength2 / locLength;
		}
		
		public var name:String;
		
		private var _threadMax:uint=2;
		
		private var _thread:int;
		
		private var _queue:Array;
		
		private var _loadQueue:Array;
		
		private var _completeQueue:Array;
		
		private var _nonCompleteGroup:Array;
		
		private var _proxyRes:Array;
		
		private var _hashMap:flash.utils.Dictionary;
		
		private var _host:IResourceGroup;
		
		private var _isComplete:Boolean=true;
	}
}