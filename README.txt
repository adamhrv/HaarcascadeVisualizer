This is a test for CV Dazzle's future github push.

Here's a visualizer I made that allows you to render the haarfeatures from the cascade files.

Notes:

1. The XML library changed in Processing 2.0 and is causing problems with getChild(). I added the old XML library from 1.5 to my libraries location for the sketch to run. This will need to be fixed>

2. You can change the cascade file in the top of the sketch

	String cascadeFile = "haarcascade_frontalface_default.xml";

3. Clicking "Render first" will render only the first stage, a quick test.

4. Clicking "Render all" will render all stages. This can take while and is a good workout for your CPU. The files are saved into a folder within the sketch's directory, as .tif images.



* There is a more complete version of this that is animated, but it was made in Eclipse. It's part of the CV Dazzle code package and will be released later this year.

Thanks,
Adam Harvey
ahprojects.com