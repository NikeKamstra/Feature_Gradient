package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Nike
	 */
	public class GradientBar extends MovieClip
	{
		
		public function GradientBar(width:int, height:int, stage:Stage) 
		{			
			graphics.beginFill(0xFF0000, 1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			x = (stage.stageWidth - width) /2;
			y = (stage.stageHeight - height) /2;
		}
		
	}

}