package 
{
	import contrller.BasicViewerController;
	
	import gameContext.GameContext;
	
	import interfaces.controller.IBasicViewerController;
	
	public class XController extends BasicViewerController implements IBasicViewerController
	{
		public function XController()
		{
			super();
			setLayerType();
		}
		
		public function getGuider(step:*):*
		{
			return viewer;
		}
		
		final public function get gameContext():GameContext
		{
			return GameContext.getInstance();
		}
		
		protected function setLayerType():void
		{
			throw new Error("必须设定所在层的类型，请继承方法 setLayerType");
		}
	}
}