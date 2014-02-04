package flump.export
{

	import com.adobe.images.PNGEncoder;
	import com.threerings.util.XmlUtil;
	
	import flash.filesystem.File;
	import flash.utils.IDataOutput;
	
	import flump.SwfTexture;
	import flump.mold.KeyframeMold;
	import flump.mold.MovieMold;
	import flump.xfl.XflLibrary;
	import flump.xfl.XflTexture;
		
	public class CCBFormat extends PublishFormat
	{
		public static const NAME :String = "CCB";
		
		public function CCBFormat (destDir :File, lib :XflLibrary, conf :ExportConf) {
			super(destDir, lib, conf);
			_assetname = lib.location;
			_assetDir  = _assetname + "Assets";
			_prefix    = "./";
		}
		
		override public function get modified () :Boolean {
			return true;
		}
		
		override public function publish () :void {
			const libExportDir :File = _destDir.resolvePath(_prefix + _assetDir + "/" + "resources-auto");
			
			// Ensure any previously generated atlases don't linger
			if (libExportDir.exists) libExportDir.deleteDirectory(/*deleteDirectoryContents=*/true);
			libExportDir.createDirectory();
			
			// Extract/Write Individual Textures 
			var textures:Array = new Array(); 
			var SWFTexture: SwfTexture;
			var movie :MovieMold;
			
			// Animation Texture Frame
			for each (var tex :XflTexture in _lib.textures) {
				SWFTexture = (SwfTexture.fromTexture(_lib.swf, tex, _conf.quality, _conf.scale));
				textures.push(SWFTexture); // Add Texture
				Files.write( libExportDir.resolvePath(SWFTexture.symbol + ".png"), function (out :IDataOutput) :void {  out.writeBytes(PNGEncoder.encode(SWFTexture.toBitmapData())); });
			}
			
			// Flipbook Texture Frames
			for each (movie in _lib.movies) {
				if (!movie.flipbook) continue;
				for each (var kfm :KeyframeMold in movie.layers[0].keyframes) {
					SWFTexture = (SwfTexture.fromFlipbook(_lib, movie, kfm.index, _conf.quality, _conf.scale));
					textures.push(SWFTexture); // Add Texture
					Files.write( libExportDir.resolvePath(SWFTexture.symbol + ".png"), function (out :IDataOutput) :void {  out.writeBytes(PNGEncoder.encode(SWFTexture.toBitmapData())); });
				}
			}
			
			const prefix :String = _lib.location + "/";
			for each (movie in _lib.publishedMovies) {
				
				var movieXml :XML = movie.scale(_conf.scale).toXML();
				var Ref: String = ''; // @testing kFirst Frame Check
				var movieName :String = movieXml.@name;
				var frameRate: Number = _lib.frameRate;
				var animationLength: Number = 0; // Default
				
				// CCB Per Animation
				var metaFile: File  = _destDir.resolvePath(_prefix + _lib.location + "_" + movieXml.@name + "." + CCBFormat.NAME.toLowerCase());
				trace("Movie: "+ movieName + ", FPS: " + frameRate);
				
				// Write CCB (Skip Scene(s), UnSupported for now, add CCBFile support at some point.)
				if(metaFile.url.indexOf("scene")>=0)
					continue;
				
				// Start CCB Format
				var export :String = "";
				export+=CCBHelper.addHeader();
				export+=CCBHelper.startNode();

				// Parse Layers
				for each (var layer :XML in movieXml..layer) {
					
					trace("Layer: "+ layer.@name);
					
					// Reset Per Layer (Should all be same)
					animationLength = 0;
					
					// Layer Animation Frame Array
					var animation :Array = new Array();
					
					//Parse Key Frames 
					for each (var kf :XML in layer..kf) {
					
						// Check KF Valid
						if (XmlUtil.hasAttr(kf, "ref")) {
							
							trace("KF: "+ kf.@ref);
							
							// Lookup Symbol Texture
							var width  :Number = 1;
							var height :Number = 1;
							for each (var TextureLookup: SwfTexture in textures) {
								if(TextureLookup.symbol==kf.@ref) {
									width  = TextureLookup.w;
									height = TextureLookup.h;
									break;
								}
							}
							
							// Create Frame
							var frame: CCBFrame = new CCBFrame();
							
							// Symbol
							frame.symbol = kf.@ref.toString();
							
							// Duration
							if(kf.@duration.length()>0) { 
								frame.duration =  ( (60 / frameRate) * Number(kf.@duration) ) / 60; 
								animationLength+=frame.duration;
							}
							
							
							// Position
							if(kf.@loc.length()>0) { 
								frame.position = kf.@loc.split(/,/);
								frame.position[0] = Number(frame.position[0])/_conf.scale; 
								frame.position[1] = (Number(frame.position[1])*-1)/_conf.scale;     // Flip Y
							}
							
							// Anchor
							if(kf.@pivot.length()>0) { 
								frame.anchor = kf.@pivot.split(/,/);
								frame.anchor[0] = frame.anchor[0]/width;
								frame.anchor[1] = 1 - (frame.anchor[1]/height);
							}
							
							// Scale
							if(kf.@scale.length()>0) { 
								frame.scale = kf.@scale.split(/,/);
							}
							
							// Skew / Rotation
							if(kf.@skew.length()>0) { 
								frame.skew = kf.@skew.split(/,/);
								frame.rotation[0] = frame.skew[0] * 180.0/Math.PI;
								frame.rotation[1] = frame.skew[1] * 180.0/Math.PI;
							}
							
							animation.push(frame);
							
							// Layer Name
							Ref = movieXml..layer.@name;
							
						}
						
					}
					
					
					// Build Animation
					export+=CCBHelper.addAnimation(animation,_assetDir);
					
					// Export First Frame (Default Display)
					var tempFrame: CCBFrame = animation[0];
					trace("Exporting Sprite: " + tempFrame.symbol);
					export+=CCBHelper.addSprite(tempFrame.symbol,_assetDir,tempFrame.position,tempFrame.anchor,tempFrame.scale,tempFrame.skew,tempFrame.rotation);
					
				}
				
				// End CCB
				export+=CCBHelper.endNode();
				export+=CCBHelper.addFooter(animationLength);
				
				// Write Movie
				export = export.replace (/\s*\R/g, "\n");  // Remove Empty Lines
				Files.write(metaFile, function (out :IDataOutput) :void { out.writeUTFBytes(export); });
			}

		}
		
		protected var _assetname :String;
		protected var _prefix :String;
		protected var _assetDir :String;
		
	}
}

