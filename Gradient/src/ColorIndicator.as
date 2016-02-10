package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorIndicator extends MovieClip
	{
		private var c_ColorSquare:Sprite = new Sprite;
		
		//boolean that shows if the indicator should be dragged by the user
		private var c_IsDragging:Boolean = false;
		
		//the maximum position on the x-axis
		private var c_XMaxPosition:int;
		
		//position of the indicators on the x-axis (furthest has the highest position)
		private var c_Position:int;
		
		//the color that is presented within the colorindicator
		public var c_CurrentColor:uint;
		
		public var c_XPosition:int;
		
		public function ColorIndicator(color:uint, barWidth:int, barHeight:int, position:int, xPosition:int = -50) 
		{
			//draw the black background 
			graphics.beginFill(0x000000, 1);
			graphics.moveTo(3.5, 0);
			graphics.lineTo(7, 3);
			graphics.lineTo(0, 3);
			graphics.lineTo(3.5, 0);
			graphics.drawRect(0, 3, 7, 7);
			graphics.endFill();
			
			//change the color which is presented by the indicator
			ChangeColor(color);
			
			//define the max position on the x axis
			c_XMaxPosition = barWidth - 5.5;
			
			//on initiating of this program, start with 2 indicators on the start & end of the gradientbar
			if((position == 0 || position == 2) && xPosition == -50) {
				xPosition = position == 0 ? -1.5 : c_XMaxPosition;
			} 
			
			//place the indicator to its respective coordinates
			x = xPosition;
			y = barHeight;
			
			c_XPosition = x + 1.5;
			
			addChild(c_ColorSquare);
			
			addEventListener(Event.ENTER_FRAME, loop);
			
			addEventListener(MouseEvent.CLICK, SwitchColor);
			addEventListener(MouseEvent.MOUSE_DOWN, StartDragging);
		}
		
		//change the color which is presented by the indicator
		private function ChangeColor(color:uint):void {
			if (color != c_CurrentColor) {
				c_ColorSquare.graphics.clear();
				c_ColorSquare.graphics.beginFill(color);
				c_ColorSquare.graphics.drawRect(1, 4, 5, 5);
				c_ColorSquare.graphics.endFill();
				
				c_CurrentColor = color;
			}
		}
		
		//changes position on the x-axis on the start of each frame, if the indicator should be dragged
		private function loop(e:Event):void {
			if(c_IsDragging) {
				x += mouseX - 3;
				
				//constraints to min/max position on x axis
				if (x < -1.5) 
					x = -1.5;
				else if (x > c_XMaxPosition) 
					x = c_XMaxPosition;
					
				c_XPosition = x + 1.5;
			}
		}
		
		private function StartDragging(e:MouseEvent):void {
			c_IsDragging = true;
		}
		
		//just a simple test for now
		private function SwitchColor(e:MouseEvent):void {
			ChangeColor(c_CurrentColor == 0x00FF00 ? 0xFF0000 : 0x00FF00);
		}
		
		public function StopDragging():void {
			c_IsDragging = false;
		}
	}

}