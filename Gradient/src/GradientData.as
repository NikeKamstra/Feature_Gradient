package  
{
	/**
	 * ...
	 * @author Nike
	 */
	public class GradientData 
	{
		public var c_StartColor:uint;
		public var c_EndColor:uint;
		public var c_StartPosition:int;
		public var c_EndPosition:int;
		public var c_Distance:int;
		public var c_RGBChangePerPixel:Vector.<Number> = new Vector.<Number>(3);
		
		public function GradientData(sc:uint, ec:uint, sp:int, ep:int) 
		{
			c_StartColor = sc;
			c_EndColor = ec;
			c_StartPosition = sp;
			c_EndPosition = ep;
			c_Distance = ep - sp;
			c_RGBChangePerPixel = ColorCalc.RGBChangesBetweenColors(sc, ec, c_Distance);
		}
		
	}

}