package rsl
{
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;

	/**
	 * RSL 管理
	 */	
	public class RSL
	{
		private static var _appDict:Dictionary = new Dictionary;
		
		public static function addDomain(domain:ApplicationDomain):void
		{
			if (domain == null)
				throw new ArgumentError("ApplicationDomain can not be null!");
			_appDict[domain] = true;
		}
		
		public static function getDefinition(name:String):*
		{
			var value:Object;
			var domain:ApplicationDomain = ApplicationDomain.currentDomain;
			if (domain.hasDefinition(name))
				value = domain.getDefinition(name);
			else
			{
				for (var k:* in _appDict)
				{
					domain = k;
					if (domain.hasDefinition(name))
					{
						value = domain.getDefinition(name);
						break;
					}
				}
			}
			if (value == null)
			{
				try
				{
					value = getDefinitionByName(name);
				} 
				catch(error:Error) 
				{
					
				}
			}
			return value;
		}
		
		public static function hasDefinition(name:String):Boolean
		{
			var domain:ApplicationDomain = ApplicationDomain.currentDomain;
			if (domain.hasDefinition(name))
				return true;
			else 
			{
				for (var k:* in _appDict)
				{
					domain = k;
					if (domain.hasDefinition(name))
						return true;
				}
			}
			
			return false;
		}
	}
}