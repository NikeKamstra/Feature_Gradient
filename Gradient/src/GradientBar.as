package  
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	import ColorIndicator;
	import InnerGradientBar;
	
	/**
	 * ...
	 * @author Nike
	 */
	public class GradientBar extends MovieClip
	{
		//for this building phase we start with 2 static color indicators
		private var c_FirstColorIndicator:ColorIndicator;
		private var c_SecondColorIndicator:ColorIndicator;
		
		//the gradientbar containing the preview of the gradient
		private var c_InnerGradientBar:InnerGradientBar;
		
		public function GradientBar(width:int, height:int, stage:Stage) 
		{		
			//first draw the black background
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			//move self to the middle
			x = (stage.stageWidth - width) /2;
			y = (stage.stageHeight - height) / 2;
			
			//instantiate the colorindicators with their colors, barwidth/height & position
			c_FirstColorIndicator = new ColorIndicator(0xFF0000, width, height, 0);
			c_SecondColorIndicator = new ColorIndicator(0x00FF00, width, height, 1);
			
			//instantiate the previewing gradientbar with barwidth/height
			c_InnerGradientBar = new InnerGradientBar(width, height);
			
			addChild(c_FirstColorIndicator);
			addChild(c_SecondColorIndicator);
			addChild(c_InnerGradientBar);
		}
		
		//if the user decides to stop dragging outside of the color indicators, this will tell the indicators to stop dragging
		public function MouseUp(e:MouseEvent):void {
			c_FirstColorIndicator.StopDragging();
			c_SecondColorIndicator.StopDragging();
		}
		
	}

}