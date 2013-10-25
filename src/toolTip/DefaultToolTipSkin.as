package toolTip
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import interfaces.toolTip.IToolTipData;
	import interfaces.toolTip.IToolTipSkin;
	
	public class DefaultToolTipSkin extends Sprite implements IToolTipSkin
	{
		public function DefaultToolTipSkin()
		{
			super();
			this.init();
		}
		
		public function setTipData(arg1:IToolTipData):void
		{
			var str:String=null;
			this.tipData = arg1;
			if (arg1.getSkinData() is String) 
			{
				str = arg1.getSkinData() as String;
				this.setHtmlText(str);
			}
			return;
		}
		
		public function setTarget(arg1:*):void
		{
			return;
		}
		
		public function show(arg1:DisplayObjectContainer):void
		{
			arg1.addChild(this);
			this.updatePosition(arg1);
			return;
		}
		
		public function hide(arg1:DisplayObjectContainer):void
		{
			if (this.stage) 
			{
				parent.removeChild(this);
			}
			this.dispose();
			return;
		}
		
		public function updatePosition(arg1:DisplayObjectContainer):void
		{
			x = arg1.mouseX + 15;
			y = arg1.mouseY + 10;
			return;
		}
		
		protected function dispose():void
		{
			return;
		}
		
		protected function setHtmlText(arg1:String):void
		{
			this._txt.htmlText = arg1;
			this.reDraw();
			return;
		}
		
		protected function reDraw():void
		{
			this.graphics.clear();
			this.graphics.beginFill(16777215);
			this.graphics.drawRect(0, 0, this._txt.textWidth + 5, this._txt.textHeight + 5);
			this.graphics.endFill();
			return;
		}
		
		private function init():void
		{
			this.mouseChildren = false;
			this.mouseEnabled = false;
			this._txt = new TextField();
			this._txt.border = true;
			this._txt.autoSize = "left";
			this._txt.cacheAsBitmap = true;
			addChild(this._txt);
			return;
		}
		
		protected var tipData:IToolTipData;
		
		protected var _txt:TextField;
	}
}