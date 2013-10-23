package debugger
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	
	public class Debugger extends Sprite
	{
		public function Debugger(arg1:Class, arg2:int=10)
		{
			super();
			if (null == arg1) 
			{
				throw "scrollBarClass is null";
			}
			if (_instance) 
			{
				return;
			}
			_instance = this;
			_textField = new TextField();
			uiScrollBar = new arg1();
			_maxLine = arg2;
			addChild(_textField);
			_textField.multiline = true;
			_textField.wordWrap = true;
			_textField.background = true;
			_textField.backgroundColor = 4473924;
			_textField.textColor = 16777215;
			_textField.height = 400;
			_textField.width = 360;
			uiScrollBar["x"] = _textField.width;
			uiScrollBar["scrollTarget"] = _textField;
			uiScrollBar["width"] = _textField.width;
			uiScrollBar["height"] = _textField.height;
			addChild(uiScrollBar);
			addEventListener(flash.events.Event.ADDED_TO_STAGE, this.onAdd);
			print(INFORMATION);
			resize();
			this.visible = false;
			return;
		}
		
		private function onAdd(arg1:Event):void
		{
			removeEventListener(flash.events.Event.ADDED_TO_STAGE, this.onAdd);
			this.stage.addChild(_instance);
			this.stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, this.onKeyDown);
			return;
		}
		
		private function onKeyDown(arg1:KeyboardEvent):void
		{
			if (false == arg1.ctrlKey) 
			{
				return;
			}
			var loc1:*=arg1.keyCode;
		}
		
		public static function print(... rest):void
		{
			if (!_instance) 
			{
				return;
			}
			trace(rest);
			var index:int=0;
			while (index < rest.length) 
			{
				_textField.appendText(rest[index]);
				++index;
			}
			_textField.appendText("\n");
			_textField.scrollV = _textField.numLines;
			resize();
			return;
		}
		
		protected static function resize():void
		{
			var loc1:*;
			(loc1 = uiScrollBar)["update"]();
			return;
		}
		
		public static function replace(... rest):void
		{
			if (!_instance) 
			{
				return;
			}
			clear();
			print(rest);
			return;
		}
		
		public static function clear():void
		{
			if (!_instance) 
			{
				return;
			}
			_textField.text = "";
			return;
		}
		
		
		{
			_contentVec = new Vector.<String>();
		}
		
		public static const VERSION:String="1.0001";
		
		private static const INFORMATION:String="DebugPanel" + VERSION + "Ctrl + \n H: help \n C: clear \n 9(小键盘):Hide/Show";
		
		private static var _instance:Debugger;
		
		private static var _textField:TextField;
		
		private static var _maxLine:int;
		
		private static var _contentVec:__AS3__.vec.Vector.<String>;
		
		private static var uiScrollBar:flash.display.DisplayObject;
	}
}


//  class _37c7764bc2426900274f5c883569501dcd07e211fea32500270c096d97121e45_flash_display_Sprite
//package 
//{
//	import flash.display.*;
//	import flash.system.*;
//	
//	public class _37c7764bc2426900274f5c883569501dcd07e211fea32500270c096d97121e45_flash_display_Sprite extends flash.display.Sprite
//	{
//		public function _37c7764bc2426900274f5c883569501dcd07e211fea32500270c096d97121e45_flash_display_Sprite()
//		{
//			super();
//			return;
//		}
//		
//		public function allowDomainInRSL(... rest):void
//		{
//			flash.system.Security.allowDomain.apply(null, rest);
//			return;
//		}
//		
//		public function allowInsecureDomainInRSL(... rest):void
//		{
//			flash.system.Security.allowInsecureDomain.apply(null, rest);
//			return;
//		}
//	}
//}