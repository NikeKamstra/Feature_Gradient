package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorIndicator extends MovieClip
	{
		//the color that is presented within the colorindicator
		private var c_CurrentColor:uint;
		//boolean that shows if the indicator should be dragged by the user
		private var c_IsDragging:Boolean = false;
		//position of the indicators on the x-axis (furthest has the highest position)
		private var c_Position:int;
		
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
			
			//on initiating of this program, start with 2 indicators on the start & end of the gradientbar
			if((position == 0 || position == 1) && xPosition == -50) {
				xPosition = position == 0 ? -3.5 : barWidth - 3.5; 
			} 
			
			//place the indicator to its respective coordinates
			x = xPosition;
			y = barHeight;
			
			addEventListener(Event.ENTER_FRAME, loop);
			
			addEventListener(MouseEvent.CLICK, SwitchColor);
			addEventListener(MouseEvent.MOUSE_DOWN, StartDragging);
		}
		
		//change the color which is presented by the indicator
		private function ChangeColor(color:uint):void {
			if(color != c_CurrentColor) {
				graphics.beginFill(color);
				graphics.drawRect(1, 4, 5, 5);
				graphics.endFill();
				
				c_CurrentColor = color;
			}
		}
		
		//changes position on the x-axis on the start of each frame, if the indicator should be dragged
		private function loop(e:Event):void {
			if(c_IsDragging) {
				x += mouseX - 3;
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