package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Nike
	 */
	public class InnerGradientBar extends MovieClip
	{
		
		public function InnerGradientBar(barWidth:int, barHeight:int) 
		{
			//draw white placeholder
			graphics.beginFill(0xFFFFFF, 1);
			graphics.drawRect(0, 0, barWidth-4, barHeight-4);
			graphics.endFill();
			
			//move self to middle of the black background(parent) with a 'stroke' of 2
			x = 2;
			y = 2;
		}
		
	}

}