package  
{
	/**
	 * ...
	 * @author Nike
	 */
	public class ColorCalc 
	{
		
		public function ColorCalc() 
		{
			
		}
		
		public static function RGBChangesBetweenColors(color1:uint, color2:uint, distance:int):Vector.<Number> {
			var RGBChanges:Vector.<Number> = new Vector.<Number>(3);
			
			var r1:uint = ((color1 >> 16) & 0xFF);
			var r2:uint = ((color2 >> 16) & 0xFF);
			var g1:uint = ((color1 >> 8) & 0xFF);
			var g2:uint = ((color2 >> 8) & 0xFF);
			var b1:uint = (color1 & 0xFF);
			var b2:uint = (color2 & 0xFF);

			RGBChanges[0] = (r2 - r1) / distance;
			RGBChanges[1] = (g2 - g1) / distance;
			RGBChanges[2] = (b2 - b1) / distance;

			return RGBChanges;
		}
		
		public static function GradientColorAtPosition(gradientData:GradientData, position:int):uint {
			var r:uint = ((gradientData.c_StartColor >> 16) & 0xFF) + gradientData.c_RGBChangePerPixel[0] * position;
			var g:uint = ((gradientData.c_StartColor >> 8) & 0xFF) + gradientData.c_RGBChangePerPixel[1] * position;
			var b:uint = (gradientData.c_StartColor & 0xFF) + gradientData.c_RGBChangePerPixel[2] * position;
			
			return ((r<<16)|(g<<8)|b);
		}
	}

}