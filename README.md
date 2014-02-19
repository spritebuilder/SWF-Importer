Flash To SpriteBuilder Tool
===================

## How to build

The easiest way to build this app is to use Adobe Flash Builder 4.7:  
 - Simply checkout this repository and then select 'File/Import Flash Build Project'.  
 - Select 'Project Folder' and navigate to the repository and click 'Finish'.
 - Then select 'Run/Run'.

You can probably use [Apache Flex](http://flex.apache.org/) to build as well however this is an exercise for the reader.

## Download

If you want to download the app please check [Releases](https://github.com/cocojoe/Flash2CCB/releases) for a binary.

## Conversion Tutorial

This tutorial will cover the process of converting an existing Adobe Flash animation to [SpriteBuilder](http://www.spritebuilder.com/), you will be using some awesome artwork kindly donated by Vincent Le Quang, Melissa Wallace and Anna Klonoff. 

 - [Pika](https://github.com/jacklehamster/herosmasks/raw/master/Vincent/Flash/pika.fla)
 - [Masks](https://github.com/jacklehamster/herosmasks/raw/master/Vincent/Flash/masks.fla)

`Note:` You will require both FLA source files and SWF for any flash content you wish to convert.

## Preperation

Open pika.fla (CS5+), you should see a few funky looking creatures in various colours.  To keep things clean create a new flash AS3 document, I called it bluebeast.fla.

Select the blue creature from pika.fla and copy this into the bluebeast.fla document. Hit play to watch this majestic beast in action, would make a nice endless runner....

Double click the 'Pika run' symbol from the library.

Hit play to watch this majestic beast in action, this creature would make a nice endless runner....

**Step 1)** Open properties for Pika run and tick the `Export for ActionScript`, then tick `Export in frame 1`, the base class should be `flash.display.MoveClip`.

Great this will now be picked up as an animation for the conversion tool, you then need to ensure all of the component parts of this animation can be exported as textures.  You can see various symbols such as Eye, EarFront and Horn in the Library view.

**Step 2)** Select all of the symbols from 'BackLeg' down to 'Tail', unselect 'Pika Run' and then edit properties.

**Step 3)** Tick `type` and ensure `Move Clip` is selected from the drop down.  Tick `Export for Actionscript` and change the dropdown to `Yes`, don't worry about any warnings. Tick `Export in frame 1` andchange the dropdown to `Yes`.  Tick the `Base class` and enter `flash.display.Sprite`. Hit OK.

**Step 5)** Hit Publish

Oh there are some Compiler Errors... Well let's get rid of these, double click the first one. Clear the text `stop();`, close that mini window and save. Hit Publish again, great all working.

## Conversion

Open up the Flash2CCB tool.

**Step 1)** Select the directory containing the bluebeast fla/swf files.

You should see `bluebeast` listed in the **Conversion Summary**, if valid does not say Yes then you need to go back and check you followed the previous steps correctly.

**Step 2)** Select an export directory, if you want to export into an existing SpriteBuilder project then select the `SpriteBuilder Resources` folder inside your SpriteBuilder project.

**Step 3)** Select the bluebeast and hit `Preview`, looking good.

**Step 4)** Hit Export All.

You should now have a file called bluebeast_pikarun.ccb and a bluebeastAssets folder in your export directory.

## SpriteBuilder

Great let's see these in action in SpriteBuilder.

Important: The current App Store version (1.0.3) of SpriteBuilder is not fully compatible with this tool, if you want to ensure compatibility please build from [SpriteBuilder source](https://github.com/apportable/SpriteBuilder).

**Step 1)** Create a new project, I called it 'bluedemo', it will open up the MainScene.  Right click on 'MainScene.ccb in the File view and select `Show in Finder`.

**Step 2)** Copy the files from the export into this directory and then click back to the SpriteBuilder view. In a couple of seconds you will see 'bluebeat_pikarun.ccb' appear in File view.

**Step 3)** Enjoy, click the new ccb and hit play, you should see pika running.

## Credits

- The guys that did the hardwork, [Three Rings](https://github.com/threerings)
- CCB Exporter/Ux/Conversion Tutorial, [Martin Walsh](http://github.com/cocojoe)
- Tutorial Flash content: Vincent Le Quang, Anna Klonoff and Melissa Wallace

### Maintainers

- [Martin Walsh](http://github.com/cocojoe)
- [Support Forum](http://forum.spritebuilder.com/)

## License

See the LICENSE file for more info.
