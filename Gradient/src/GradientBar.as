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
		
		private var c_IndicatorBox:MovieClip = new MovieClip();
		
		public function GradientBar(width:int, height:int, stage:Stage) 
		{		
			//first draw the black background
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			c_IndicatorBox.graphics.beginFill(0x000000, 0.25);
			c_IndicatorBox.graphics.drawRect(0, 0, width, 10);
			c_IndicatorBox.graphics.endFill();
			
			c_IndicatorBox.y = height;
			
			c_IndicatorBox.addEventListener(MouseEvent.MOUSE_DOWN, AddNewIndicator);
			
			addChild(c_IndicatorBox);
			
			//move self to the middle
			x = (stage.stageWidth - width) /2;
			y = (stage.stageHeight - height) / 2;
			
			//instantiate the first colorindicators with their colors, barwidth/height & position
			for (var i:int = 0; i < 2; i++) 
			{
				var newColorIndicator:ColorIndicator = new ColorIndicator(0xFF0000, width, height, i);
				Logic.c_ColorIndicators.push(newColorIndicator);
			}
			
			AddNewIndicator(null, width / 2 - 2);
			MouseUp(null);
			
			//instantiate the previewing gradientbar with barwidth/height
			c_InnerGradientBar = new InnerGradientBar(width, height);
			
			for (var j:int = 0; j < Logic.c_ColorIndicators.length; j++) 
			{
				addChild(Logic.c_ColorIndicators[j]);
			}
			
			addChild(c_InnerGradientBar);
		}
		
		private function AddNewIndicator(e:MouseEvent = null, position:int = 0):void {
			position = e == null ? position : mouseX;
			var ci:ColorIndicator = new ColorIndicator(0x0000FF, width, height-c_IndicatorBox.height, -1, position);
			Logic.AddNewColorIndicator(ci);
			addChild(ci);
			Logic.c_IsBeingEdited = true;
		}
		
		//if the user decides to stop dragging outside of the color indicators, this will tell the indicators to stop dragging
		public function MouseUp(e:MouseEvent):void {
			for (var i:int = 0; i < Logic.c_ColorIndicators.length; i++) 
			{
				Logic.c_ColorIndicators[i].StopDragging();
			}
		}
		
	}

}