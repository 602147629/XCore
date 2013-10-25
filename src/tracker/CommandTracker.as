package tracker
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import interfaces.notify.IExpandNotifyMethod;
	
	import org.puremvc.as3.interfaces.INotification;

	public class CommandTracker
	{
		private static var _filterCommandType:Dictionary = new Dictionary();
		
		/**
		 * 是否开启跟踪
		 */
		public static var enableTracking:Boolean = true;
		
		/**
		 * 打印简化信息(#发送实例 ^ 命令类型)
		 */
		public static var isSimlpePrint:Boolean = true;
		/**
		 * 是否打印完整发送特定通知的那个实例的类型
		 */
		public static var isPrintClassFullName:Boolean = false;
		
		/**
		 * 打印通知类型
		 */
		public static var isPrintNoteType:Boolean = true;
		/**
		 * 打印通知值类型名称
		 */
		public static var isPrintDataClassName:Boolean = true;
		/**
		 * 打印通知值
		 */
		public static var isPrintDataValue:Boolean = true;
		
		public static function track(notifier:IExpandNotifyMethod, note:INotification):void
		{
			CONFIG::DEBUG
			{
				var inFilter:Boolean = null != _filterCommandType[note.getType()];
				if ("" != note.getType() && !inFilter)
				{
					var className:String = "";
					if (isPrintClassFullName)
					{
						className = flash.utils.getQualifiedClassName(notifier);
					}
					else
					{
						className = Object(notifier).toString();
					}
					
					if (isSimlpePrint)
					{
						className = Object(notifier).toString();
						printSimpleInfo(className, note.getType());
					}
					else
					{
						printStartLine();
						printInfo(className);
						if (isPrintNoteType)
						{
							printNoteType(note.getType());
						}
						if (isPrintDataClassName)
						{
							printData(note.getBody(), isPrintDataValue);
						}
					}
				}
			}
		}
		
		/**
		 * 设置过滤, 过滤列表(String)
		 * @param types	Array	过滤列表
		 */
		public static function set filters(types:Array):void
		{
			_filterCommandType = new Dictionary();
			var len:uint = types.length;
			for (var i:uint = 0; i < len; i++)
			{
				_filterCommandType[types[i]] = true;
			}
		}
		
		//--------------------------------------------------------------------------------------------------
		// Private Function
		//--------------------------------------------------------------------------------------------------
		private static function printSimpleInfo(className:String, type:String):void
		{
			trace("#", className, " ^ ", type);
		}
		
		private static function printStartLine():void
		{
			trace("==========================");
		}
		
		private static function printInfo(info:*):void
		{
			trace("<DISPATCHER>		", info);
		}
		
		private static function printNoteType(data:*):void
		{
			trace("<TYPE>			", data);
		}
		
		private static function printData(data:*, isPrintValue:Boolean):void
		{
			var dataClassName:String = getQualifiedClassName(data);
			trace("<DATACLASSNAME> 	", dataClassName);
			if (isPrintValue)
			{
				trace("<DATA>			", data);
			}
		}
	}
}