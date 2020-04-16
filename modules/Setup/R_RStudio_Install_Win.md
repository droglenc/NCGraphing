---
layout: page
title: R and RStudio for Windows
css: /css/modules.css
---

## Installing R and Rstudio

To install R on a Windows machine, downloaded the installer from [this site](https://cloud.r-project.org/bin/windows/base/){:target="_blank"} by selecting the "Download R X.X.X for Windows" link at the top. Locate the installer on your computer and run it. Using all of the default choices will perform an acceptable install for this class.[^WinR]

To install RStudio on a Windows machine, download the installer from [this link](https://rstudio.com/products/rstudio/download/#download){:target="_blank"} by selecting the "DOWNLOAD RSTUDIO FOR WINDOWS" button. Locate the installer on your computer and run it. Using all of the default choices will perform an acceptable install for this class.[^WinRStudio]

&nbsp;

## Installing Tidyverse
Extra functionality can be added to R with packages. The `tidyverse` package is the main package that we will use in this class. You can install the `tidyverse` package on your computer by opening RStudio (not R, but RStudio) and selecting the *File* menu, *New File* submenu, and *R Script* subsubmenu, which will open a new pane in the upper-left corner of RStudio. In that new pane type the code below exactly as it appears here.

```
install.packages("tidyverse",type="binary")
```

Then with your cursor on the line that you just typed press the "Run" button (towards the right side of the top of the pane you just typed in; see below). RStudio should then do a "bunch of stuff" (you will seen a window flashing by).[^InstallingNote] After several minutes, the lower-left pane (the "console") should have a ">" symbol on the last line (see below).

<img src="../zimgs/InstallPackages_1.png" alt="Installing Tidyverse" style="display: block; margin-left: auto; margin-right: auto; width: 90%;">

At this point the installation is complete if no errors occurred along the way. You can check for success by typing the code below exactly as it appears here and running it (make sure your cursor is on the line with the code below and then press "Run" button).

```
library(tidyverse)
```

If your lower-left pane resembles the one shown below then you have successfully installed the `tidyverse` package.

<img src="../zimgs/InstallPackages_2.png" alt="Installing Tidyverse" style="display: block; margin-left: auto; margin-right: auto; width: 90%;">

&nbsp;

## Optimally Configuring RStudio
I suggest changing the following default settings in RStudio for optimal efficiency.

* In RStudio select the "Tools" menu and "Global Options" submenu.
  * Under the "Workspace" heading (assuming that "General" on the left is selected) ...
    * Turn off (unselect) the "Restore .RData into workspace at startup" item.
    * Change "Ask" following "Save Workspace to .RData on exit:" to "Never".
  * Select "Code" on the left and "Display" at the top ...
    * Turn on (select) "Highlight selected line".
    * Turn on (select) "Show margin" (and I usually put 80 as the "Margin column").
    * Turn on (select) "Show syntax highlighting in console input".
  * Press "OK".

&nbsp;

### Footnotes

[^WinR]: More detailed instructions [are here](http://derekogle.com/IFAR/supplements/installations/InstallRWin.html){:target="_blank"}, but note that the current version is either 3.6.3 or 4.0.0.

[^WinRStudio]: More detailed instructions [are here](http://derekogle.com/IFAR/supplements/installations/InstallRStudioWin.html){:target="_blank"}, but note that the current version is at least 1.2.5042.

[^InstallingNote]: The `tidyverse` package depends on many other packages. What RStudio is doing during this process is install all of those other packages.