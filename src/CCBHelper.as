// CCB Format Helpers
package
{
	public class CCBHelper
	{

		public static function addHeader():String
		{
			var export:String = ( 
			<![CDATA[<?xml version="1.0" encoding="UTF-8"?>
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
		
		public static function addFooter(length: Number):String
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
			<real>{length}</real>
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
			
			export = export.replace(/{length}/gs,length);
			
			return export;
		}
		
		public static function addSprite(frame: CCBFrame, path: String):String
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
							<string>{path}/{symbol}.png</string>
						</array>
					</dict>
					<dict>
						<key>baseValue</key>
						<real>1</real>
						<key>name</key>
						<string>opacity</string>
						<key>type</key>
						<string>Float</string>
						<key>value</key>
						<real>{opacity}</real>
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
			
			// Asset
			export = export.replace(/{path}/gs,path);
			export = export.replace(/{name}/gs,frame.layer);
			export = export.replace(/{symbol}/gs,frame.symbol);
			
			// Position
			export = export.replace(/{positionX}/gs,frame.position[0]);
			export = export.replace(/{positionY}/gs,frame.position[1]);
			
			// Anchor
			export = export.replace(/{anchorX}/gs,frame.anchor[0]);
			export = export.replace(/{anchorY}/gs,frame.anchor[1]);
			
			// Scale
			export = export.replace(/{scaleX}/gs,frame.scale[0]);
			export = export.replace(/{scaleY}/gs,frame.scale[1]);
			
			// Skew
			export = export.replace(/{skewX}/gs,frame.skew[0]);
			export = export.replace(/{skewY}/gs,frame.skew[1]);
			
			// Rotation Skew 
			export = export.replace(/{rotationX}/gs,frame.rotation[0]);
			export = export.replace(/{rotationY}/gs,frame.rotation[1]);
			
			// Opacity
			export = export.replace(/{opacity}/gs,frame.opacity);
			
			return export;
			
		}
		
		public static function addAnimation(frames: Array, path: String):String
		{
			
			var export :String = '';
			
			// Animated Properties Blocks
			var startAnimatedProperties:String = ( 
				<![CDATA[
			<dict>
				<key>animatedProperties</key>
				<dict>
					<key>0</key>
					<dict>
				]]> ).toString();
			
			var endAnimatedProperties:String = ( 
				<![CDATA[
					</dict>
				</dict>
				]]> ).toString();
			
			// Begin Animated Properties
			export+=startAnimatedProperties;
			
			// Position Keyframes
			export+=CCBHelper.addPositionFrames(frames,path);
			
			// Rotational Keyframes
			export+=CCBHelper.addRotationalSkewXFrames(frames,path);
			export+=CCBHelper.addRotationalSkewYFrames(frames,path);
			
			// Skew Keyframes
			export+=CCBHelper.addSkewFrames(frames,path);
			
			// Sprite Keyframes
			export+=CCBHelper.addSpriteFrames(frames,path);
			
			// Opacity Keyframes
			export+=CCBHelper.addOpacityFrames(frames,path);
			

			// End Animated Properties
			export+=endAnimatedProperties;
			
			return export;
		}
		
		private static function addSpriteFrames(frames: Array, path :String):String {
			
			var export :String = '';
			
			// Sprite Frame Blocks
			var startSpriteFrameProperties:String = ( 
				<![CDATA[
						<key>spriteFrame</key>
						<dict>
							<key>keyframes</key>
							<array>
				]]> ).toString();
			
			var endSpriteFrameProperties:String = ( 
				<![CDATA[
							</array>
							<key>name</key>
							<string>spriteFrame</string>
							<key>type</key>
							<integer>7</integer>
						</dict>
				]]> ).toString();
			
			// Sprite Frame Keyframes
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
			
			// Sprite Frames
			export+=startSpriteFrameProperties;
			
			// Create Key Frames
			var time: Number = 0;
			for each (var frame :CCBFrame in frames) {
				
				// Keyframe Block
				var animationBlock :String = spriteFrameTemplate;
				
				// Sprite Path
				animationBlock = animationBlock.replace(/{path}/gs,path);
				animationBlock = animationBlock.replace(/{symbol}/gs,frame.symbol);
				
				// Time
				animationBlock = animationBlock.replace(/{time}/gs,time);
				
				// Increment Duration (For Next KeyFrame)
				time+=frame.duration;
				
				// Add To CCB
				export+=animationBlock;
			}
			
			// End Sprite Frame
			export+=endSpriteFrameProperties;
			
			return export;
		}
		
		private static function addPositionFrames(frames: Array, path :String):String {
			
			var export :String = '';
			
			// Sprite Frame Blocks
			var startPositionFrameProperties:String = ( 
				<![CDATA[
						<key>position</key>
						<dict>
							<key>keyframes</key>
							<array>
				]]> ).toString();
			
			var endPositionFrameProperties:String = ( 
				<![CDATA[
							</array>
							<key>name</key>
							<string>position</string>
							<key>type</key>
							<integer>3</integer>
						</dict>
				]]> ).toString();
			
			// Sprite Frame Keyframes
			var positionFrameTemplate :String = (
				<![CDATA[
								<dict>
									<key>easing</key>
									<dict>
										<key>type</key>
										<integer>1</integer>
									</dict>
									<key>name</key>
									<string>position</string>
									<key>time</key>
									<real>{time}</real>
									<key>type</key>
									<integer>3</integer>
									<key>value</key>
									<array>
										<real>{positionX}</real>
										<real>{positionY}</real>
									</array>
								</dict>
			]]> ).toString();
			
			// Sprite Frames
			export+=startPositionFrameProperties;
			
			// Create Key Frames
			var time: Number = 0;
			for each (var frame :CCBFrame in frames) {
				
				// KeyFrame Block
				var animationBlock :String = positionFrameTemplate;
				
				// Position
				animationBlock = animationBlock.replace(/{positionX}/gs,frame.position[0]);
				animationBlock = animationBlock.replace(/{positionY}/gs,frame.position[1]);
				
				// Time
				animationBlock = animationBlock.replace(/{time}/gs,time);
				
				// Increment Duration (For Next KeyFrame)
				time+=frame.duration;
				
				// Add To CCB
				export+=animationBlock;
			}
			
			// End Sprite Frame
			export+=endPositionFrameProperties;
			
			return export;
		}
		
		private static function addSkewFrames(frames: Array, path :String):String {
			
			var export :String = '';
			
			// Key Frame Blocks
			var startKeyFrameProperties:String = ( 
				<![CDATA[
						<key>skew</key>
						<dict>
							<key>keyframes</key>
							<array>
				]]> ).toString();
			
			var endKeyFrameProperties:String = ( 
				<![CDATA[
							</array>
							<key>name</key>
							<string>skew</string>
							<key>type</key>
							<integer>3</integer>
						</dict>
				]]> ).toString();
			
			// Skew Keyframe
			var skewFrameTemplate :String = (
				<![CDATA[
								<dict>
									<key>easing</key>
									<dict>
										<key>type</key>
										<integer>1</integer>
									</dict>
									<key>name</key>
									<string>skew</string>
									<key>time</key>
									<real>{time}</real>
									<key>type</key>
									<integer>8</integer>
									<key>value</key>
									<array>
										<real>{skewX}</real>
										<real>{skewY}</real>
									</array>
								</dict>
			]]> ).toString();
			
			// Sprite Frames
			export+=startKeyFrameProperties;
			
			// Create Key Frames
			var time: Number = 0;
			for each (var frame :CCBFrame in frames) {
				
				// KeyFrame Block
				var animationBlock :String = skewFrameTemplate;
				
				// Position
				animationBlock = animationBlock.replace(/{skewX}/gs,frame.skew[0]);
				animationBlock = animationBlock.replace(/{skewY}/gs,frame.skew[1]);
				
				// Time
				animationBlock = animationBlock.replace(/{time}/gs,time);
				
				// Increment Duration (For Next KeyFrame)
				time+=frame.duration;
				
				// Add To CCB
				export+=animationBlock;
			}
			
			// End Sprite Frame
			export+=endKeyFrameProperties;
			
			return export;
		}
		
		private static function addRotationalSkewXFrames(frames: Array, path :String):String {
			
			var export :String = '';
			
			// Key Frame Blocks
			var startKeyFrameProperties:String = ( 
				<![CDATA[
						<key>rotationalSkewX</key>
						<dict>
							<key>keyframes</key>
							<array>
				]]> ).toString();
			
			var endKeyFrameProperties:String = ( 
				<![CDATA[
							</array>
							<key>name</key>
							<string>rotationalSkewX</string>
							<key>type</key>
							<integer>2</integer>
						</dict>
				]]> ).toString();
			
			// Rotational Skew Keyframe
			var rotationFrameTemplate :String = (
				<![CDATA[
								<dict>
									<key>easing</key>
									<dict>
										<key>type</key>
										<integer>1</integer>
									</dict>
									<key>name</key>
									<string>rotationalSkewX</string>
									<key>time</key>
									<real>{time}</real>
									<key>type</key>
									<integer>2</integer>
									<key>value</key>
									<real>{rotationalSkewX}</real>
								</dict>
			]]> ).toString();
			
			// Sprite Frames
			export+=startKeyFrameProperties;
			
			// Create Key Frames
			var time: Number = 0;
			for each (var frame :CCBFrame in frames) {
				
				// KeyFrame Block
				var animationBlock :String = rotationFrameTemplate;
				
				// Position
				animationBlock = animationBlock.replace(/{rotationalSkewX}/gs,frame.rotation[0]);
				
				// Time
				animationBlock = animationBlock.replace(/{time}/gs,time);
				
				// Increment Duration (For Next KeyFrame)
				time+=frame.duration;
				
				// Add To CCB
				export+=animationBlock;
			}
			
			// End Sprite Frame
			export+=endKeyFrameProperties;
			
			return export;
		}
		
		private static function addRotationalSkewYFrames(frames: Array, path :String):String {
			
			var export :String = '';
			
			// Key Frame Blocks
			var startKeyFrameProperties:String = ( 
				<![CDATA[
						<key>rotationalSkewY</key>
						<dict>
							<key>keyframes</key>
							<array>
				]]> ).toString();
			
			var endKeyFrameProperties:String = ( 
				<![CDATA[
							</array>
							<key>name</key>
							<string>rotationalSkewX</string>
							<key>type</key>
							<integer>2</integer>
						</dict>
				]]> ).toString();
			
			// Rotational Skew Keyframe
			var rotationFrameTemplate :String = (
				<![CDATA[
								<dict>
									<key>easing</key>
									<dict>
										<key>type</key>
										<integer>1</integer>
									</dict>
									<key>name</key>
									<string>rotationalSkewY</string>
									<key>time</key>
									<real>{time}</real>
									<key>type</key>
									<integer>2</integer>
									<key>value</key>
									<real>{rotationalSkewY}</real>
								</dict>
			]]> ).toString();
			
			// Sprite Frames
			export+=startKeyFrameProperties;
			
			// Create Key Frames
			var time: Number = 0;
			for each (var frame :CCBFrame in frames) {
				
				// KeyFrame Block
				var animationBlock :String = rotationFrameTemplate;
				
				// Position
				animationBlock = animationBlock.replace(/{rotationalSkewY}/gs,frame.rotation[1]);
				
				// Time
				animationBlock = animationBlock.replace(/{time}/gs,time);
				
				// Increment Duration (For Next KeyFrame)
				time+=frame.duration;
				
				// Add To CCB
				export+=animationBlock;
			}
			
			// End Sprite Frame
			export+=endKeyFrameProperties;
			
			return export;
		}
		
		private static function addOpacityFrames(frames: Array, path :String):String {
			
			var export :String = '';
			
			// Key Frame Blocks
			var startKeyFrameProperties:String = ( 
				<![CDATA[
						<key>opacity</key>
						<dict>
							<key>keyframes</key>
							<array>
				]]> ).toString();
			
			var endKeyFrameProperties:String = ( 
				<![CDATA[
							</array>
							<key>name</key>
							<string>opacity</string>
							<key>type</key>
							<integer>10</integer>
						</dict>
				]]> ).toString();
			
			// Opacity Keyframe
			var opacityFrameTemplate :String = (
				<![CDATA[
								<dict>
									<key>easing</key>
									<dict>
										<key>type</key>
										<integer>1</integer>
									</dict>
									<key>name</key>
									<string>opacity</string>
									<key>time</key>
									<real>{time}</real>
									<key>type</key>
									<integer>10</integer>
									<key>value</key>
									<real>{opacity}</real>
								</dict>
			]]> ).toString();
			
			// Sprite Frames
			export+=startKeyFrameProperties;
			
			// Create Key Frames
			var time: Number = 0;
			for each (var frame :CCBFrame in frames) {
				
				// KeyFrame Block
				var animationBlock :String = opacityFrameTemplate;
				
				// Position
				animationBlock = animationBlock.replace(/{opacity}/gs,frame.opacity);
				
				// Time
				animationBlock = animationBlock.replace(/{time}/gs,time);
				
				// Increment Duration (For Next KeyFrame)
				time+=frame.duration;
				
				// Add To CCB
				export+=animationBlock;
			}
			
			// End Sprite Frame
			export+=endKeyFrameProperties;
			
			return export;
		}
		
	}
}