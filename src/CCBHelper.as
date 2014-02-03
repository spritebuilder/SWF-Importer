// CCB Format Helpers
package
{
	public class CCBHelper
	{

		public static function addHeader():String
		{
			var export:String = ( 
			<![CDATA[
			<?xml version="1.0" encoding="UTF-8"?>
			<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
			<plist version="1.0">
				<dict>
				<key>centeredOrigin</key>
				<false/>
				<key>currentResolution</key>
				<integer>0</integer>
				<key>currentSequenceId</key>
				<integer>0</integer>
				<key>docDimensionsType</key>
				<integer>1</integer>
				<key>fileType</key>
				<string>CocosBuilder</string>
				<key>fileVersion</key>
				<integer>4</integer>
				<key>guides</key>
				<array/>
				<key>jsControlled</key>
				<false/>
				<key>nodeGraph</key>
			]]> ).toString();
			
			return export;
		}
		
		public static function startNode():String
		{
			var export:String = ( 
			<![CDATA[
				<dict>
				<key>baseClass</key>
				<string>CCNode</string>
				<key>children</key>
				<array>
			]]> ).toString();
			
			return export;
		}
		
		public static function endNode():String
		{
			var export:String = ( 
			<![CDATA[
				</array>
					<key>customClass</key>
					<string></string>
					<key>displayName</key>
					<string>CCNode</string>
					<key>memberVarAssignmentName</key>
					<string></string>
					<key>memberVarAssignmentType</key>
					<integer>0</integer>
					<key>properties</key>
					<array>
						<dict>
							<key>name</key>
							<string>name</string>
							<key>type</key>
							<string>StringSimple</string>
							<key>value</key>
							<string></string>
						</dict>
						<dict>
							<key>name</key>
							<string>position</string>
							<key>type</key>
							<string>Position</string>
							<key>value</key>
							<array>
								<real>0.0</real>
								<real>0.0</real>
								<integer>0</integer>
								<integer>0</integer>
								<integer>0</integer>
							</array>
						</dict>
						<dict>
							<key>name</key>
							<string>contentSize</string>
							<key>type</key>
							<string>Size</string>
							<key>value</key>
							<array>
								<real>0.0</real>
								<real>0.0</real>
								<integer>0</integer>
								<integer>0</integer>
							</array>
						</dict>
						<dict>
							<key>name</key>
							<string>anchorPoint</string>
							<key>type</key>
							<string>Point</string>
							<key>value</key>
							<array>
								<real>0.0</real>
								<real>0.0</real>
							</array>
						</dict>
						<dict>
							<key>name</key>
							<string>scale</string>
							<key>type</key>
							<string>ScaleLock</string>
							<key>value</key>
							<array>
								<real>1</real>
								<real>1</real>
								<false/>
								<integer>0</integer>
							</array>
						</dict>
					</array>
				</dict> 
			]]> ).toString();
			
			return export;
		}
		
		public static function addFooter():String
		{
			var export:String = ( 
				<![CDATA[
				<key>notes</key>
				<array/>
				<key>resolutions</key>
				<array>
					<dict>
						<key>centeredOrigin</key>
						<false/>
						<key>ext</key>
						<string>phone</string>
						<key>height</key>
						<integer>0</integer>
						<key>name</key>
						<string>Phone</string>
						<key>scale</key>
						<real>1</real>
						<key>width</key>
						<integer>0</integer>
					</dict>
					<dict>
						<key>centeredOrigin</key>
						<false/>
						<key>ext</key>
						<string>tablet phonehd</string>
						<key>height</key>
						<integer>0</integer>
						<key>name</key>
						<string>Tablet</string>
						<key>scale</key>
						<real>2</real>
						<key>width</key>
						<integer>0</integer>
					</dict>
				</array>
				<key>sequences</key>
				<array>
					<dict>
						<key>autoPlay</key>
						<true/>
						<key>callbackChannel</key>
						<dict>
							<key>keyframes</key>
							<array/>
							<key>type</key>
							<integer>12</integer>
						</dict>
						<key>chainedSequenceId</key>
						<integer>-1</integer>
						<key>length</key>
						<real>10</real>
						<key>name</key>
						<string>Default Timeline</string>
						<key>offset</key>
						<real>0.0</real>
						<key>position</key>
						<real>0.0</real>
						<key>resolution</key>
						<real>30</real>
						<key>scale</key>
						<real>128</real>
						<key>sequenceId</key>
						<integer>0</integer>
						<key>soundChannel</key>
						<dict>
							<key>isExpanded</key>
							<false/>
							<key>keyframes</key>
							<array/>
							<key>type</key>
							<integer>11</integer>
						</dict>
					</dict>
				</array>
				<key>stageBorder</key>
				<integer>3</integer>
			</dict>
			</plist>
			]]> ).toString();
			
			return export;
		}
		
		public static function addSprite(name: String, path: String, position: Array, anchor: Array,  scale: Array, skew: Array, rotation: Array):String
		{
			var export:String = ( 
			<![CDATA[
				<key>baseClass</key>
				<string>CCSprite</string>
				<key>children</key>
				<array/>
				<key>customClass</key>
				<string></string>
				<key>displayName</key>
				<string>{name}</string>
				<key>memberVarAssignmentName</key>
				<string></string>
				<key>memberVarAssignmentType</key>
				<integer>0</integer>
				<key>usesFlashSkew</key>
				<true/>
				<key>properties</key>
				<array>
					<dict>
						<key>name</key>
						<string>name</string>
						<key>type</key>
						<string>StringSimple</string>
						<key>value</key>
						<string></string>
					</dict>
					<dict>
						<key>name</key>
						<string>position</string>
						<key>type</key>
						<string>Position</string>
						<key>value</key>
						<array>
							<real>{positionX}</real>
							<real>{positionY}</real>
							<integer>0</integer>
							<integer>0</integer>
							<integer>0</integer>
						</array>
					</dict>
					<dict>
						<key>name</key>
						<string>anchorPoint</string>
						<key>type</key>
						<string>Point</string>
						<key>value</key>
						<array>
							<real>{anchorX}</real>
							<real>{anchorY}</real>
						</array>
					</dict>
					<dict>
						<key>name</key>
						<string>scale</string>
						<key>type</key>
						<string>ScaleLock</string>
						<key>value</key>
						<array>
							<real>{scaleX}</real>
							<real>{scaleY}</real>
							<false/>
							<integer>0</integer>
						</array>
					</dict>
					<dict>
						<key>name</key>
						<string>rotationalSkewX</string>
						<key>type</key>
						<string>Degrees</string>
						<key>value</key>
						<real>{rotationX}</real>
					</dict>
					<dict>
						<key>name</key>
						<string>rotationalSkewY</string>
						<key>type</key>
						<string>Degrees</string>
						<key>value</key>
						<real>{rotationY}</real>
					</dict>
					<dict>
						<key>name</key>
						<string>skew</string>
						<key>type</key>
						<string>FloatXY</string>
						<key>value</key>
						<array>
							<real>{skewX}</real>
							<real>{skewY}</real>
						</array>
					</dict>
					<dict>
						<key>name</key>
						<string>spriteFrame</string>
						<key>type</key>
						<string>SpriteFrame</string>
						<key>value</key>
						<array>
							<string></string>
							<string>{path}/{name}.png</string>
						</array>
					</dict>
					<dict>
						<key>name</key>
						<string>color</string>
						<key>type</key>
						<string>Color3</string>
						<key>value</key>
						<array>
							<real>1</real>
							<real>1</real>
							<real>1</real>
							<real>1</real>
						</array>
					</dict>
				</array>
			</dict>
			]]> ).toString();
			
			// Basics
			export = export.replace(/{path}/gs,path);
			export = export.replace(/{name}/gs,name);
			
			// Position
			export = export.replace(/{positionX}/gs,position[0]);
			export = export.replace(/{positionY}/gs,position[1]);
			
			// Anchor
			export = export.replace(/{anchorX}/gs,anchor[0]);
			export = export.replace(/{anchorY}/gs,anchor[1]);
			
			// Scale
			export = export.replace(/{scaleX}/gs,scale[0]);
			export = export.replace(/{scaleY}/gs,scale[1]);
			
			// Skew
			export = export.replace(/{skewX}/gs,skew[0]);
			export = export.replace(/{skewY}/gs,skew[1]);
			
			// Rotation
			export = export.replace(/{rotationX}/gs,int(rotation[0]));
			export = export.replace(/{rotationY}/gs,int(rotation[1]));
			
			return export;
			
		}
		
		public static function addAnimation(frames: Array, path: String):String
		{
			var export :String = '';
			
			var startAnimatedProperties:String = ( 
				<![CDATA[
				<dict>
				<key>animatedProperties</key>
				<dict>
					<key>0</key>
					<dict>
						<key>spriteFrame</key>
						<dict>
							<key>keyframes</key>
							<array>
				]]> ).toString();
			
			var endAnimatedProperties:String = ( 
				<![CDATA[
							</array>
							<key>name</key>
							<string>spriteFrame</string>
							<key>type</key>
							<integer>7</integer>
						</dict>
					</dict>
				</dict>
				]]> ).toString();
			
			var spriteFrameTemplate :String = (
				<![CDATA[
						<dict>
							<key>easing</key>
							<dict>
								<key>type</key>
								<integer>0</integer>
							</dict>
							<key>name</key>
							<string>spriteFrame</string>
							<key>time</key>
							<real>{time}</real>
							<key>type</key>
							<integer>7</integer>
							<key>value</key>
							<array>
								<string>{path}/{symbol}.png</string>
								<string>Use regular file</string>
							</array>
						</dict>
			]]> ).toString();
			
			// Being Animated Properties
			export+=startAnimatedProperties;
			
			// Create Key Frames
			var time: Number = 0;
			for each (var frame :CCBFrame in frames) {
				var animationBlock :String = spriteFrameTemplate;
				
				// Sprite Reference
				animationBlock = animationBlock.replace(/{path}/gs,path);
				animationBlock = animationBlock.replace(/{symbol}/gs,frame.symbol);
				
				// Time
				animationBlock = animationBlock.replace(/{time}/gs,time);
				
				// Increment Duration (For Next KeyFrame)
				time+=frame.duration;
				
				// Add To CCB
				export+=animationBlock;
			}
			
			// End Animated Properties
			export+=endAnimatedProperties;
			
			return export;
		}
		
		

	}
}