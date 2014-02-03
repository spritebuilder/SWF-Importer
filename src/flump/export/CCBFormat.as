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

				// CCB Per Animation
				var metaFile: File  = _destDir.resolvePath(_prefix + _lib.location + "_" + movieXml.@name + "." + CCBFormat.NAME.toLowerCase());
				trace("Movie: "+ movieXml.@name );
				
				// Write CCB (Skip Scene(s), UnSupported for now, add CCBFile support at some point.)
				if(metaFile.url.indexOf("scene")>=0)
					continue;
				
				// Start CCB Format
				var export :String = "";
				export+=CCBHelper.addHeader();
				export+=CCBHelper.startNode();

				var animation :String = "";
				
				// Layer Exports
				for each (var kf :XML in movieXml..kf) {
					
					if (XmlUtil.hasAttr(kf, "ref") && Ref!=movieXml..layer.@name) {
						
						trace("Layer: "+ kf.@ref);
						
						// Lookup Symbol Texture
						var width  :Number = 1
						var height :Number = 1;
						for each (var TextureLookup: SwfTexture in textures) {
							if(TextureLookup.symbol==kf.@ref) {
								width = TextureLookup.w;
								height = TextureLookup.h;
							}
						}
						
						// Defaults
						var anchor: Array=[0.5,0.5];
						var scale: Array=[1,1];
						var skew: Array=[0,0];
						var rotation: Array=[0,0];
						var position: Array=[0,0];
						
						// Position
						if(kf.@loc.length()>0) { 
							position = kf.@loc.split(/,/);
							position[0] = Number(position[0])/_conf.scale; 
							position[1] = (Number(position[1])*-1)/_conf.scale;     // Flip Y
						}
						
						// Anchor
						if(kf.@pivot.length()>0) { 
							anchor = kf.@pivot.split(/,/);
							anchor[0] = anchor[0]/width;
							anchor[1] = 1 - (anchor[1]/height);
						}
						
						// Scale
						if(kf.@scale.length()>0) { 
							scale = kf.@scale.split(/,/);
						}
						
						// Skew / Rotation
						if(kf.@skew.length()>0) { 
							skew = kf.@skew.split(/,/);
							rotation[0] = skew[0] * 180.0/Math.PI;
							rotation[1] = skew[1] * 180.0/Math.PI;
						}
						
						export+=CCBHelper.addSprite(kf.@ref,_assetDir,position,anchor,scale,skew,rotation,animation);
					}
					
					Ref = movieXml..layer.@name;

				}
				
				// End CCB
				export+=CCBHelper.endNode();
				export+=CCBHelper.addFooter();
				
				Files.write(metaFile, function (out :IDataOutput) :void { out.writeUTFBytes(export); });
				
				// break; // Focusing on Single Animation
			}

		}
		
		protected var _assetname :String;
		protected var _prefix :String;
		protected var _assetDir :String;
		
	}
}

