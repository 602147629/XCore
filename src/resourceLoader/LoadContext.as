package resourceLoader
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import interfaces.resourceLoader.IResource;

	public class LoadContext
	{
		public function LoadContext(max:int=3, maxThread:Boolean=true)
		{
			this._maxThread = max;
			this._max = max;
			if (maxThread) 
			{
				this._timer = new Timer(1000);
				this._timer.addEventListener(TimerEvent.TIMER, this.onTimer);
				this._timer.start();
			}
		}
		
		private function onTimer(event:TimerEvent):void
		{
			this._current;
		}
		
		public function get maxThread():int
		{
			return this._maxThread;
		}
		
		public function set maxThread(maxThread:int):void
		{
			this._maxThread = maxThread;
		}
		
		public function requestThread(iResource:IResource):Boolean
		{
			var loadContext:LoadContext;
			var maxThread:int=((loadContext = this)._maxThread - 1);
			loadContext._maxThread = maxThread;
			if (this._maxThread < 0) 
			{
				throw new Error("Thread NUM Error.");
			}
			this._current = iResource;
			return true;
		}
		
		public function releaseThread(iResource:IResource):void
		{
			var loadContext:LoadContext;
			var maxThread:int=((loadContext = this)._maxThread + 1);
			loadContext._maxThread = maxThread;
			if (this._maxThread > this._max) 
			{
				throw new Error("Thread NUM Error.");
			}
		}
		
		private var _maxThread:int=2;
		
		private var _max:int;
		
		private var _current:IResource;
		
		private var _timer:Timer;
	}
}