package resourceLoader
{
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	
	/**
	 * Loader加载上下文，RELEASE版会自动添加 applicationDomain, securityDomain 参数
	 * @author cdr
	 */	
	public class FLoaderContext extends LoaderContext
	{
		public function FLoaderContext(checkPolicyFile:Boolean=false, applicationDomain:ApplicationDomain=null, securityDomain:SecurityDomain=null)
		{
			CONFIG::RELEASE
			{
				if (securityDomain == null)
					securityDomain = SecurityDomain.currentDomain;
			}
			super(checkPolicyFile, applicationDomain, securityDomain);
		}
	}
}