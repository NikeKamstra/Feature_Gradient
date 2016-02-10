package 
{
	import flash.events.MouseEvent;	
	import flash.display.StageScaleMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import GradientBar;
	
	/**
	 * ...
	 * @author Nike
	 */
	public class Main extends Sprite 
	{
		//the bar to control the gradient
		private var c_GradientBar:GradientBar;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//deny an ugly aspect made by the browser/user
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//the backgroundimage containing the gradient
			var bitmapData:BitmapData = new BitmapData(200, 200, true, 0x00FFFFFF);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			
			//make the gradientbar
			c_GradientBar = new GradientBar(stage.stageWidth/2, stage.stageHeight/10, stage);
			
			//add all objects to the stage
			this.addChild(bitmap);
			this.addChild(c_GradientBar);
			
			stage.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
		}
		
		//if the user decides to stop dragging outside of the color indicators, this will tell the indicators to stop dragging
		private function MouseUp(e:MouseEvent):void {
			c_GradientBar.MouseUp(e);
		}
		
	}
	
}