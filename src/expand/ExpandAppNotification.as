package expand
{
	import notification.AppNotification;

	public class ExpandAppNotification extends AppNotification
	{
		public function ExpandAppNotification(name:String=null, body:Object=null, type:String=null)
		{
			super(name, body, type);
		}
		
		public function addResult(arg1:*):void
		{
			this._result.push(arg1);
		}
		
		public function removeResultAt(index:int):void
		{
			this._result.splice(index, 1);
		}
		
		public function get result():Array
		{
			return this._result;
		}
		
		public function get firstResult():*
		{
			var loc1:*=this._result[0];
			return loc1;
		}
		
		public override function dispatch():void
		{
			this._result = new Array();
			super.dispatch();
		}
		
		public function clone(haveType:Boolean=true, haveData:Boolean=true):ExpandAppNotification
		{
			var exAppNotify:ExpandAppNotification=new ExpandAppNotification();
			if (haveType) 
			{
				exAppNotify.setType(this.getType());
			}
			if (haveData) 
			{
				exAppNotify.setBody(this.getBody());
			}
			return exAppNotify;
		}
		
		private var _result:Array;
	}
}