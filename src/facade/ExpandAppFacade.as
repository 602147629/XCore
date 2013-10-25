package facade
{
	import command.AppCommand;
	
	import error.FacadeError;
	
	import flash.utils.Dictionary;
	
	import interfaces.IDelegate;
	import interfaces.IManager;
	
	import notification.AppNotification;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ExpandAppFacade extends Facade implements IManager
	{
		
		public function ExpandAppFacade()
		{
			super();
			this._commandDic = new Dictionary();
		}
		
		public function addCommand(commandName:String, commandClass:Class):void
		{
			var errorStr:String=null;
			if ("" == commandName || null == commandName || null == commandClass) 
			{
				errorStr = FacadeError.NOT_CORRECT_COMMAND;
				throw new FacadeError(errorStr);
			}
			var arr:Array=this._commandDic[commandName];
			if (!arr) 
			{
				arr = new Array();
				this._commandDic[commandName] = arr;
			}
			var index:int=arr.indexOf(commandClass);
			if (index == -1) 
			{
				arr.push(commandClass);
			}
		}
		
		public function removeCommandBy(commandName:String, commandClass:Class):void
		{
			var index:int=0;
			var arr:Array=this._commandDic[commandName];
			if (null != arr) 
			{
				index = arr.indexOf(commandClass);
				if (-1 != index) 
				{
					arr.splice(index, 1);
					if (arr.length == 0) 
					{
						this._commandDic[commandName] = null;
						delete this._commandDic[commandName];
					}
				}
			}
		}
		
		public function checkCommandExist(commandName:String, commandClass:Class):Boolean
		{
			var index:int=0;
			var exist:Boolean=false;
			var arr:Array=this._commandDic[commandName];
			if (null != arr) 
			{
				index = arr.indexOf(commandClass);
				if (-1 != index) 
				{
					exist = true;
				}
			}
			return exist;
		}
		
		public function checkNotificationExsit(commandName:String):Boolean
		{
			var exist:Boolean=false;
			var arr:Array=this._commandDic[commandName];
			if (null != arr) 
			{
				if (arr.length > 0) 
				{
					exist = true;
				}
			}
			return exist;
		}
		
		override public function executeCommand(iNotify:INotification):void
		{
			var length:int=0;
			var index:int=0;
			var iCommandInstance:Class=null;
			var iCommand:ICommand=null;
			var errorStr:String=null;
			var exsit:Boolean=false;
			var type:String=iNotify.getName() as String;
			var arr:Array=this._commandDic[type];
			if (arr != null)
			{
				arr = arr.concat();
				length = arr.length;
				index = 0;
				while (index < length) 
				{
					iCommandInstance = arr[index];
					iCommand = new iCommandInstance;
					iCommand.execute(iNotify);
					exsit = true;
					++index;
				}
			}
			if (!exsit) 
			{
				errorStr = FacadeError.NOT_EXSIT_COMMAND + " [" + type + "]";
				throw new FacadeError(errorStr);
			}
		}
		
		protected var _commandDic:Dictionary;
		
		protected var _appName:String;
		
		public function set name(name:String):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function get name():String
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		public function set appName(appName:String):void
		{
			// TODO Auto Generated method stub
			_appName = appName;
		}
		
		public function get appName():String
		{
			// TODO Auto Generated method stub
			return _appName;
		}
		
		public function dispose():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function set delegate(idelegate:IDelegate):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function get delegate():IDelegate
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		public function register(arg1:*):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function createNotification():AppNotification
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		
	}
}