package  
{
	/**
	 * ...
	 * @author Nike
	 */
	public class Logic 
	{
		public static var c_ColorIndicators:Vector.<ColorIndicator> = new Vector.<ColorIndicator>();
		public static var c_IsBeingEdited:Boolean = false;
		
		public function Logic() 
		{
			
		}
		
		public static function AddNewColorIndicator(ci:ColorIndicator):void {
			ci.c_Position = c_ColorIndicators.length;
			c_ColorIndicators.push(ci);
			var newposition:int;
			for (var i:int = 0; i < c_ColorIndicators.length; i++) 
			{
				if (ci.c_XPosition < c_ColorIndicators[i].c_XPosition) {
					newposition = i;
					break;
				}
			}
			AlterColorIndicatorPositions(ci.c_Position, newposition);
		}
		
		public static function AlterColorIndicatorPositions(currentPosition:int, newPosition:int):void {
			if (currentPosition == newPosition) {
				trace("oops" + newPosition);
				return;
			} else {
				var newVector:Vector.<ColorIndicator> = new Vector.<ColorIndicator>();
				if (currentPosition < newPosition) {
					for (var i:int = 0; i < c_ColorIndicators.length; i++) 
					{
						if (i < currentPosition) {
							newVector.push(c_ColorIndicators[i]);
						} else if ( i > currentPosition && i <= newPosition ) {
							c_ColorIndicators[i].c_Position = i - 1;
							newVector.push(c_ColorIndicators[i]);
						}
					}
					c_ColorIndicators[currentPosition].c_Position = newPosition;
					newVector.push(c_ColorIndicators[currentPosition]);
					for (var j:int = newPosition+1; j < c_ColorIndicators.length; j++) 
					{
						newVector.push(c_ColorIndicators[j]);
					}
				} else {
					for (var k:int = c_ColorIndicators.length-1; k > -1 ; k--) 
					{
						if (k > currentPosition) {
							newVector.unshift(c_ColorIndicators[k]);
						} else if ( k < currentPosition && k >= newPosition ) {
							c_ColorIndicators[k].c_Position = k + 1;
							newVector.unshift(c_ColorIndicators[k]);
						}
					}
					c_ColorIndicators[currentPosition].c_Position = newPosition;
					newVector.unshift(c_ColorIndicators[currentPosition]);
					for (var l:int = newPosition-1; l > -1; l--) 
					{
						newVector.unshift(c_ColorIndicators[l]);
					}
				}
				if (newVector.length == 3) {
					trace(newVector[0].c_Position + " " + newVector[1].c_Position + " " + newVector[2].c_Position);
				} else {
					trace(newVector[0].c_Position + " " + newVector[1].c_Position + " " + newVector[2].c_Position + " " + newVector[3].c_Position);
				}
				c_ColorIndicators = newVector;
			}
		}
		
		public static function RemoveColorIndicatorAtPosition(position:int):void {
			if(position != c_ColorIndicators.length-1) {
				AlterColorIndicatorPositions(position, c_ColorIndicators.length - 1);
			}
			c_ColorIndicators.pop();
		}
	}

}