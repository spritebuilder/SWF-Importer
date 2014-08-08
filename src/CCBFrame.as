
package
{
	public class CCBFrame
	{
		public var anchor: Array=[0.5,0.5];
		public var scale: Array=[1,1];
		public var flagScale: Boolean = false;
		public var skew: Array=[0,0];
		public var flagSkew: Boolean = false;
		public var rotation: Array=[0,0];
		public var flagRotation: Boolean = false;
		public var position: Array=[0,0];
		public var flagPosition: Boolean = false;
		public var symbol: String;
		public var duration: Number;
		public var opacity: Number = 1;
		public var flagOpacity: Boolean = false;
		public var layer: String;
		public var visiblity: Boolean = false;
		public var tweened: Boolean = true;
		
		public function CCBFrame()
		{
		}
	}
}