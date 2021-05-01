***Readme for theme compiling***

***Preface***
I made the `theme-script.s` just for me, at first, to have it easy to compile every color and variant without the need to run single scripts.
The whole script basically does following for each theme part:
- creating backup
- replace colors in scss, gtkrc and svg files using `sed`
- rendering svg using inkscape and optipng
- compiling css from scss files
- placing finished files into the right directories after creating them
- restoring backup

The scripts for compiling and rendering are just copied from Ubuntu's yaru source.
I don't use the yaru git as fork for two reason: I don't have any clue about such things as github and second I find it more easier to work with.
So I don't use scripts like `render-all-assets.svg` from Yaru directly or use mason for compiling, I just use the script lines and pasted them into my script.

I tried my best to comment nearly everything, but I'm not good in such things, so forgive me if something is hard to understand.

Those other script files, `compile_all.sh`, `compile_parts.sh`, `dock-indicators.sh` and `manual-themes.sh`, are just made to automate processes or to change the dock indicators (as the names say).

***Basic tutorial***
`theme-script.sh` has two types of usages: guided and not-guided.
I don't use the guided mode, since I know how to use my script.
But you can use it, of course.

If you run the script without paremeters, it'll ask you what to do.
Entering own colors is currently not possible since there are too much color variables.

So, to do it like me, just don't use guided mode, it's too complicated.

If you enter the command `./theme-script.sh -h` it'll prompt you which parameters you can use.

First, you need to enter a predefined color (look at `colors.txt`).
This color parameter is case sensitive! I tried to get around this but no warranty that this works.
It's case sensitive because I was too lazy to change old stuff, only...

Then you can choose between parameters for each theme part:
```
Usage: ./theme-script.sh [color] <option>

Colors: Amber, Aqua, Aubergine, Blue, Brown, Green, Grey, Lavender, MATE, Orange, Pink, Purple, Red, Teal or Yellow
Options:
 -a|--all, Compile everything without asking
 -n|--noicons, Compile everything but icons without asking
 -3|--gtk3, Compile gtk3 theme, only
 -2|--gtk2, Compile gtk2 theme, only
 -s|--shell, Compile Gnome-Shell theme, only
 -u|--unity, Compile Unity theme, only
 -i|--icons, Compile icons, only
 -c|--cursors, Compile cursors, only
 -h|--help, Print help
 without option, the script will ask for each step.
```

Examples:
`./theme-script.sh Blue -3` will create the gtk3 theme for color Blue, including dark, light and default.
`./theme-script.sh Teal --icons` will create the icon theme for Teal, without rendering the cursors.
`./theme-script.sh Blue -a` will create everything for color Blue, including icons and cursors (this will take time!)
`./theme-script.sh Lavender -n` will create everything for Lavender WITHOUT icons and cursors

This is about the basic usage.

***Advanced tutorial for adding / replacing colors***
As requested by some users, I'll try to explain how to add own colors.
To do this, we need to replace or add a new color variable - replacing for one time use is more easily, then you don't need to add or replace the color name.
For example, you have new awesome color as base-color (replacement for Yaru's orange), you can still use the color variabl Amber. Then you just need to replace every color for *Amber*.

There are a few different color shades. I created a table for this (`new color schemes.ods`). Try to stick with those shades with your new color. Darker or brighter shades are, for example, for hovering over buttons or checkboxes.
In the table there you have two base colors: ORANGE and PURPLE. Those are the origin colors.
The AUBERGINE shades are new since 20.10(?).

If you created your own palette, just replace the present color codes of the color you want to replace with search&find. That's it.

More explanation:

I've added variables for the stock colors:
```
original_base='E95420'
original_purple='762572'
original_aubergine_stock='255074' # Old Color: '924D8B'
```
After Yaru added more colors, I needed to add more variables:
```
svg1_aubergine_stock='77216F' # OLD COLOR BEFORE 21.04 and still used for GTK2!: 'aa5b9c' #Bright purple color from checkboxes or radio
svg2_aubergine_stock='5E2750' # OLD COLOR BEFORE 21.04 and still used for GTK2!: '975187' #Dark purple color from checkboxes or radio
svg3_aubergine_stock='2C001E' #Very dark purple from text arrows or sliders

gtk32_assets_aubergine_medium='9e3c8e' # replace with svg1
gtk32_assets_aubergine_dark='8b2782' # replace with svg3
gtk30_assets_aubergine_light='aa5b9c' #replace with svg1
gtk30_assets_aubergine_medium='975187' # replace with svg2
gtk30_assets_aubergine_dark='773f72' # replace with svg3

svg1_aubergine_stock_gtk2='aa5b9c' # NEW for 21.04 - like stock aubergine but a bit lighter
svg2_aubergine_stock_gtk2='975187' # NEW for 21.04 - like stock aubergine
svg3_aubergine_stock_gtk2='8A367D' # NEW for 21.04 - dark color for dark theme (slider knob)
svg4_aubergine_stock_gtk2='B889B0' # NEW for 21.04 - bright aubergine for slider knob in light/default theme
svg5_aubergine_stock_gtk2='9E3C8E' # NEW for 21.04 - medium aubergine for slider knob in light/default theme
svg5_orange_stock_gtk2='f6b6a0' # NEW for 21.04 - small graphic called "fokus", just for light/default themes, replace with svg1

# for _palette.scss in gtk3+:
palette_aubergine='924D8B'
palette_purple='762572'
palette_laubergine=$svg1_aubergine_stock
palette_maubergine=$svg2_aubergine_stock
palette_daubergine=$svg3_aubergine_stock

#stock colors for shell's svg files:
svg_shell_normal='924d8b'
svg_shell_bright='bb74b3'
svg_shell_dark='7c436f'
```

Those values need to be UNCHANGED, very important. They are written in the source files, like `assets.svg`, `gtkrc` and `_palette.scss`.

I keep with the example *Amber*.
For each color I have added new variables which will work as global variables for the whole script.
There are the the two base variables:
```
amber_base='eea834' #POP-OS based amber
amber_purple='8c5e11'
```
And also the new variables:
```
#Yaru-Colors variants:
svg1_Amber='eea834'
svg2_Amber='c08625'
svg3_Amber='412d0b'
aubergine_Amber='e9af4e'
```

Oh, I forgot to mention the icon part! That's the fun part!
The icons contain gradients made of 10 different colors.
I used https://colordesigner.io/gradient-generator for creating my gradients.
So there you have the two stock gradients:
```
g_yaru=(2c001e 370626 55163b 772953 7c2b51 8b314b 8b314b a33a41 c44732 e65524)
g_yaru_desktop=(FB7C38 9B33AE) #colors in the user-desktop.svg
```
Then the Amber gradient:
```
g_Amber=(EEA834 EEAD34 EEB234 EEB734 EEBC34 EEC134 EEC634 EECB34 EED034 EED534)
```

Just replace this gradient and don't mind the `g_yaru_desktop` variable, this is just needed as source variable since the desktop icon has just two colors and the svg file creates the gradient directly.


So we have 8 different colors you need to replace - and a gradient.
Take a look at the .ods document for the shades.

When you did this, just run `./theme-script Amber -a` to compile everything for your new color.


If you want to add a new color, choose a name for it and just copy/paste the variable blocks from another color and change it's name.

After this, add this color to the parameters within the while loop:
```
while [ ! -z "$1" ]; do
	case "$1" in
      Amber|amber)
            break
            ;;
            [......]
```

Also needed is the interprete-command-block:
```
if [[ "$color" == "Amber" ]]; then
  base_col=$amber_base
  purple_col=$amber_purple
  svg1_color=$svg1_Amber
  svg2_color=$svg2_Amber
  svg3_color=$svg3_Amber
  aubergine_color=$aubergine_Amber
  g_color=("${g_Amber[@]}")
```
Also, just copy/paste and change the colors - case sensitive!

After this you're free to fire up the script and compile your own theme using `./theme-script.sh YOURCOLOR -a`.

***How it works***
Magic.


No, as I said at the beginning: the script just contains a whole bunch of variables and scripting lines, I didn't create any rendering or compiling script.
The two magical things are:
- sassc - which compiles the scss files
- inkscape - which renders the svg files

But first, the script collects the data it needs for compiling. So it needs to know which color it should create and which part, as I said above.

The whole creating part runs in a while loop. For this I've create variables for each part:
```
comp_shell="false"
comp_gtk2="false"
comp_gtk3="false"
comp_icons="false"
comp_cursors="false"
comp_unity="false"
singlestep="false"
everything="false"
no_icons="false"
compile_done="false"
```
Those variables are set to false and get set to true using the guided mode or using the parameters.
Example:
```
--gtk3|-3)
  shift
  echo "Compiling just gtk3 without asking!"
  comp_gtk3="true"
  singlestep="true"
  ;;
```
Using the `--gtk3` or `-3` parameter, the script will only create the gtk3 part of Yaru-Color.
(search for "part parameters" to find the block).
This is the second parameter after the color parameter (search for "color parameters" in the script).

After this a bunch of variables for the stock colors and also the chosen color will be set, you see those if you scroll a bit down.

The script will also look for necessary packages (search for "package check").
Note: Inkscape has made some changes with 1.0 which need to change some commands for the cli. Thanks to Yaru devs, who already updated their scripts, I was able to do the same. So Inkscape 1.0+ is needed since 21.04.

Now the compiling loop starts:
`while [[ $compile_done == "false" ]]; do`
Basically this loop will run, until the compiling is done.
The variable gets set to "false" at the bottom of the whole script.

Before this the script will ask for each part, if it should compile the mentioned part. Example:
```
if [[ $everything == "false" ]] && [[ $singlestep == "false" ]]; then
	echo -e "Do you want to compile the gtk3 theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes)
			     comp_gtk3="true"
			     break;;
			No)
			     comp_gtk3="false"
			     break;;
		esac
	done
fi
```

If answer is Yes, it sets over to the gtk3 while loop, if No it'll ask the next question right after the gtk3 loop.

The compiling loops are all build the same:
- set path variables for source and output
- create those paths
- make backups
- replace color values
- render / compile
- copy
- restore

For this tutorial I'll explain the gtk4 (search for "C9 -"") part only, because it's small:

So, if `$comp_gtk4` is true, then start the loop.
Then it creates the gtk4 output paths, which are already set by `  gtk40_path=$COMPILED/Themes/Yaru-$color/gtk-4.0` (and also dark and light with gtk40d_path and gtk40l_path), using `mkdir -p $gtk40_path`.
Then basic commands for creating backups are following, including a check.

In the "CSS Section" the script replaces the colors in `_palette.scss`, after it switches into the right directory, using `sed`. For this it uses the previously mentioned variables for old and new colors.

Using `sassc` the css will be compiled. (explanation following)

After this, the script will replace the colors in the .svg files.

The png files are rendered using some lines of script I copied from yaru's `render-all-assets.sh`. Just search for "RENDER SVG ASSETS" - it's all the same for gtk2, gtk3, shell and gtk4.
Just read the part, it should be self-explained.
It basically just inkscape and optipng (not for gtk4 and shell).

After all the rendering progress, which will take a bit, the script ust copy the .css and asset files to the output paths and restores the backups.

That's it - nothing strange or complicated, just many lines of codes.

*icons and cursors*
Those things are basically the same, just look at the script. It will just compile the needed icons, I the compilation process takes not very long. But because of this it's needed to have Yaru as fall-back icon theme.
I also used scripts, provided by Yaru to render cursors.

***Explanations about the magic***

*sassc*:
sassc compiles .css files based on given .scss files. This method allows, for example, to provide just a few colors while the final .css file contains many shades because it uses data from scss file which say how a given color should be rendered.
It's not complicated but I don't understand it completely - and there's no reason for me to understand everything.

*inkscape*:
Inkscape, known as the popular vector program, can render svg files to png just by using cli.
The assets are written as list in `assets.txt` so inkscape know which asset it should render. Also, if you open the svg files with a text editor, you see the raw data inlcuding ids for graphics inside the svg file.
Using this information inkscape extracts each graphic and renders it.
Optipng is used to optimized the png files.



I don't know if this "tutorial" helps, but if so, I'm glad.
If now, just ask - I don't know if I can answer all questions but I try my best.
