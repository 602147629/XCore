package event.tipData
{
	import flash.events.Event;
	
	public class TipDataEvent extends Event
	{
		public function TipDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		public override function clone():flash.events.Event
		{
			return new TipDataEvent(type);
		}
		
		public static const STATUS_CHANGE:String="statusChange";
	}
}