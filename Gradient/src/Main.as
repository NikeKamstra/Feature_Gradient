package 
{
	import GradientBar;
	
	import flash.display.StageScaleMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author Nike
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var bitmapData:BitmapData = new BitmapData(200, 200, true, 0x00FFFFFF);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			
			var gradientBar:GradientBar = new GradientBar(stage.stageWidth/2, stage.stageHeight/10, stage);
			
			//this.addChild(bitmap);
			this.addChild(gradientBar);
			
			bitmap.bitmapData.setPixel32(100, 100, 0xFFFF0000);
		}
		
	}
	
}