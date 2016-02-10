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
		//the gradientbar containing the preview of the gradient
		private var c_InnerGradientBar:InnerGradientBar;
		
		//for this building phase we start with 2 static color indicators
		public var c_ColorIndicators:Vector.<ColorIndicator> = new Vector.<ColorIndicator>(); 
		
		public function GradientBar(width:int, height:int, stage:Stage) 
		{		
			//first draw the black background
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			//move self to the middle
			x = (stage.stageWidth - width) /2;
			y = (stage.stageHeight - height) / 2;
			
			//instantiate the first colorindicators with their colors, barwidth/height & position
			for (var i:int = 0; i < 3; i++) 
			{
				var color:uint = i == 1 ? 0xFFFF00 : 0xFF0000;
				var xpos:int = i == 1 ? (width - 4) / 2 : -50;
				var newColorIndicator:ColorIndicator = new ColorIndicator(color, width, height, i, xpos);
				c_ColorIndicators.push(newColorIndicator);
			}
			
			//instantiate the previewing gradientbar with barwidth/height
			c_InnerGradientBar = new InnerGradientBar(width, height);
			
			for (var j:int = 0; j < c_ColorIndicators.length; j++) 
			{
				addChild(c_ColorIndicators[j]);
			}
			
			addChild(c_InnerGradientBar);
		}
		
		//if the user decides to stop dragging outside of the color indicators, this will tell the indicators to stop dragging
		public function MouseUp(e:MouseEvent):void {
			for (var i:int = 0; i < c_ColorIndicators.length; i++) 
			{
				c_ColorIndicators[i].StopDragging();
			}
		}
		
	}

}