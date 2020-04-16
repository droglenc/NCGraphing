---
layout: page
title: R and RStudio
css: /css/modules.css
---

## What are R and RStudio?
Throughout this course we will use the R program to generate graphs. We will interact with R through the RStudio software. From your perspective, you will be using RStudio, but you will actually be writing code in the R language. RStudio simply helps make R a little easier to use. The following links provide very brief introductions to R and RStudio.

* [What is R?](https://www.youtube.com/watch?v=XcBLEVknqvY){:target="_blank"}
* [What's Up with R?](https://www.youtube.com/watch?v=ZwYQPtU2Pa0){:target="_blank"} [*stop at 1:51*]
* [What is RStudio (Part 1)?](https://www.youtube.com/watch?v=riONFzJdXcs){:target="_blank"} [*stop at 2:27*]
* [What is RStudio (Part 2)?](https://www.youtube.com/watch?v=riONFzJdXcs){:target="_blank"} [*only from 3:16 to 4:13*]

&nbsp;

## Installing the Software and Packages

<div class="alert alert-danger p-1" role="alert">
  Skip this entire section (and go <a href="#rstudio-in-the-cloud">here</a> if you plan to use RStudio in the Cloud.
</div>


#### R and Rstudio for Windows

<div class="alert alert-danger" role="alert">
  Skip this section (and goto the next section) if you are using a Mac or a ChromeBook.
</div>

To install R on a Windows machine, downloaded the installer from [this site](https://cloud.r-project.org/bin/windows/base/){:target="_blank"} by selecting the "Download R X.X.X for Windows" link at the top. Locate the installer on your computer and run it. Using all of the default choices will perform an acceptable install for this class.[^WinR]

To install RStudio on a Windows machine, download the installer from [this link](https://rstudio.com/products/rstudio/download/#download){:target="_blank"} by selecting the "DOWNLOAD RSTUDIO FOR WINDOWS" button. Locate the installer on your computer and run it. Using all of the default choices will perform an acceptable install for this class.[^WinRStudio]


#### R and Rstudio for MacOS
<div class="alert alert-danger" role="alert">
  Skip this section (and goto the next section) if you are using Windows or a ChromeBook.
</div>

To install R on a Mac, downloaded the installer from [this site](https://cloud.r-project.org/bin/macosx/){:target="_blank"} by selecting one of the "R-X.X.X.pkg" links appropriate for your operating system under the "Latest Release" section. Locate the ".pkg" file on your computer and install it per usual. Using all of the default choices will perform an acceptable install for this class.[^MacR]

To install RStudio on aMac, download the installer from [this link](https://rstudio.com/products/rstudio/download/#download){:target="_blank"} by selecting the "DOWNLOAD RSTUDIO FOR MACOS" button (you can also select the MacOS option under the "All Installers" section). Locate the ".dmg" file on your computer and install it per usual. Using all of the default choices will perform an acceptable install for this class.[^MacRStudio]


#### R and Rstudio for ChromeBooks

<div class="alert alert-danger" role="alert">
  Skip this section (and goto the next section) if you are using Windows or a Mac.
</div>

RStudio can be used on a ChromeBook but the setup is complicated. Some directions that may work for you are [here](https://community.rstudio.com/t/rstudio-desktop-on-a-chromebook-without-crouton-using-new-linux-beta-option/17393), [here](https://github.com/jennybc/operation-chromebook#links-re-r-and-rstudio), and [here](https://community.rstudio.com/t/rstudio-on-a-chromebook/2802). I am not a Chromebook user and this looks endlessly confusing to me.

It is possible, however, to use RStudio in “the cloud” through a web browser, which may be easier than installing on your ChromeBook -- see [further below](#rstudio-in-the-cloud).


#### Tidyverse
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

#### Optimally Configuring RStudio
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


## RStudio in the Cloud

<div class="alert alert-danger" role="alert">
  Skip this section if you are using RStudio on your own computer.
</div>




[^WinR]: More detailed instructions [are here](http://derekogle.com/IFAR/supplements/installations/InstallRWin.html){:target="_blank"}, but note that the current version is either 3.6.3 or 4.0.0.

[^WinRStudio]: More detailed instructions [are here](http://derekogle.com/IFAR/supplements/installations/InstallRStudioWin.html){:target="_blank"}, but note that the current version is at least 1.2.5042.

[^MacR]: More detailed instructions [are here](http://derekogle.com/IFAR/supplements/installations/InstallRMac.html){:target="_blank"}, but note that the current version is either 3.6.3 or 4.0.0.

[^MacRStudio]: More detailed instructions [are here](http://derekogle.com/IFAR/supplements/installations/InstallRStudioMac.html){:target="_blank"}, but note that the current version is at least 1.2.5042.

[^InstallingNote]: The `tidyverse` package depends on many other packages. What RStudio is doing during this process is install all of those other packages.