package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	import GradientData;
	/**
	 * ...
	 * @author Nike
	 */
	public class InnerGradientBar extends MovieClip
	{
		private var c_Height:int;
		private var c_Width:int;
		
		public function InnerGradientBar(barWidth:int, barHeight:int) 
		{
			c_Width = barWidth - 4;
			c_Height = barHeight - 4;
			
			//draw white placeholder
			graphics.beginFill(0xFFFFFF, 1);
			graphics.drawRect(0, 0, c_Width, c_Height);
			graphics.endFill();
			
			//move self to middle of the black background(parent) with a 'stroke' of 2
			x = 2;
			y = 2;
			
			addEventListener(MouseEvent.CLICK, FillGradientBar);
		}
		
		private function DrawGradient(gd:GradientData):void {
			for (var i:int = 0; i < gd.c_Distance; i++) 
			{
				var gradientColor:uint = ColorCalc.GradientColorAtPosition(gd, i);
				graphics.beginFill(gradientColor, 1);
				graphics.drawRect(gd.c_StartPosition + i, 0, 1, c_Height);
				graphics.endFill();
			}
		}
		
		private function FillGradientBar(e:MouseEvent):void {
			var colorIndicators:Vector.<ColorIndicator> = (parent as GradientBar).c_ColorIndicators;
			var gradientData:Vector.<GradientData> = new Vector.<GradientData>();
			for (var i:int = 0; i < colorIndicators.length; i++) 
			{
				if (i != colorIndicators.length - 1) {
					gradientData.push(new GradientData(colorIndicators[i].c_CurrentColor, colorIndicators[i + 1].c_CurrentColor, colorIndicators[i].c_XPosition, colorIndicators[i + 1].c_XPosition));
				}
			}
			
			graphics.clear();
			
			for (var j:int = 0; j < gradientData.length; j++) 
			{
				DrawGradient(gradientData[j]);
			}
		}
	}

}