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
		
		//the color that is presented within the colorindicator
		public var c_CurrentColor:uint;
		
		//position of the indicators on the x-axis (furthest has the highest position)
		public var c_Position:int;
		
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
			
			c_Position = position;
			
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
		
		private function CheckCollision():Boolean {
			for (var i:int = 0; i < Logic.c_ColorIndicators.length; i++) 
			{
				if (Logic.c_ColorIndicators[i].c_Position != c_Position && hitTestObject(Logic.c_ColorIndicators[i])) {
					return true;
				} 
			}
			return false;
		}
		
		private function CheckAndChangePosition():void {
			var lowerPosition:int = c_Position == 0 ? 0 : c_Position - 1;
			var higherPosition:int = c_Position == Logic.c_ColorIndicators.length-1 ? Logic.c_ColorIndicators.length-1 : c_Position + 1;
			if(Logic.c_ColorIndicators[lowerPosition].x > x || Logic.c_ColorIndicators[higherPosition].x < x) {
				var newLowerPosition:int = 0;
				var newHigherPosition:int = Logic.c_ColorIndicators.length - 1;
				for (var i:int = 0; i < Logic.c_ColorIndicators.length; i++) 
				{
					if (Logic.c_ColorIndicators[i].x < x) {
						newLowerPosition = i;
					}
					if (Logic.c_ColorIndicators[Logic.c_ColorIndicators.length-1 - i].x > x) {
						newHigherPosition = i;
					}
				}
				if (lowerPosition <= newLowerPosition) {
					Logic.AlterColorIndicatorPositions(c_Position, newLowerPosition);
				} else {
					Logic.AlterColorIndicatorPositions(c_Position, newHigherPosition);
				}
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
					
				if (CheckCollision()) {
					MoveSelfFromOverLap();
				}
				
				if(x + 1.5 != c_XPosition) {
					c_XPosition = x + 1.5;
					Logic.c_IsBeingEdited = true;
				}
				
				CheckAndChangePosition();
			}
		}
		
		private function MoveSelfFromOverLap():void {
			var moveRight:Boolean = true;
			
			for (var i:int = 0; i < Logic.c_ColorIndicators.length; i++) 
			{
				if (Logic.c_ColorIndicators[i].c_Position != c_Position && hitTestObject(Logic.c_ColorIndicators[i])) {
					if (Logic.c_ColorIndicators[i].x >= x) {
						moveRight = false;
						break;
					}
				} 
			}
			
			x += moveRight ? 0.5 : -0.5;
			
			while (CheckCollision()) 
			{
				x += moveRight ? 0.5 : -0.5;
			}
			
			if (x < -1.5 || x > c_XMaxPosition) {
				moveRight = !moveRight;
				x += moveRight ? 0.5 : -0.5;
				while (CheckCollision()) 
				{
					x += moveRight ? 0.5 : -0.5;
				}
				if (x < -1.5 || x > c_XMaxPosition) {
					trace("No spots available");
				}
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