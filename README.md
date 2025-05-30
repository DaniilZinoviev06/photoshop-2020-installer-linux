<hr><div align="center">
  <a href="#about">About</a>&ensp;&ensp;&ensp;
  <a href="#installation">Installation</a>&ensp;&ensp;&ensp;
  <a href="#settings">Settings</a>&ensp;&ensp;&ensp;
  <a href="#problems">Problems</a>&ensp;&ensp;&ensp;
  <a href="#gallery">Gallery</a>&ensp;&ensp;&ensp;
  <a href="#links">Links</a>
</div><hr>

<div align = center>
  <img alt="Image" src="https://github.com/DaniilZinoviev06/photoshop-2020-installer-linux/blob/master/images/banner.png">
</div><br>

<div align = center>
  
  [![language](https://img.shields.io/badge/language-Shell-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![OS](https://img.shields.io/badge/OS-Linux-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![Requirement](https://img.shields.io/badge/requirement-Wine-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![Requirement](https://img.shields.io/badge/requirement-Winetricks-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![Requirement](https://img.shields.io/badge/requirement-curl-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![photoshop](https://img.shields.io/badge/photoshop-CC2020-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![camera_raw](https://img.shields.io/badge/CameraRaw-v13-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub last commit](https://img.shields.io/github/last-commit/DaniilZinoviev06/photoshop-2020-installer-linux?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub License](https://img.shields.io/github/license/DaniilZinoviev06/photoshop-2020-installer-linux?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub Repo stars](https://img.shields.io/github/stars/DaniilZinoviev06/photoshop-2020-installer-linux?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub Created At](https://img.shields.io/github/created-at/DaniilZinoviev06/photoshop-2020-installer-linux?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub repo size](https://img.shields.io/github/repo-size/DaniilZinoviev06/photoshop-2020-installer-linux?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/DaniilZinoviev06/photoshop-2020-installer-linux/total?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub Release](https://img.shields.io/github/v/release/DaniilZinoviev06/photoshop-2020-installer-linux?labelColor=%2300c8ff&color=%23001d26)](#)
  [![GitHub Release Date](https://img.shields.io/github/release-date/DaniilZinoviev06/photoshop-2020-installer-linux?labelColor=%2300c8ff&color=%23001d26)](#)
  [![Tested on](https://img.shields.io/badge/tested-Arch-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![Tested on](https://img.shields.io/badge/tested-Ubuntu-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
  [![Tested on](https://img.shields.io/badge/tested-Fedora-001d26?labelColor=%2300c8ff&color=%23001d26)](#)
</div><br>

<h2 id="about">:scroll: About</h2>
<p>This script will help you install Photoshop CC 2020 on your Linux distribution using Wine.</p>

> [!NOTE]
> Wine (originally an acronym for "Wine Is Not an Emulator") is a compatibility layer capable of running Windows applications on several POSIX-compliant operating systems, such as Linux, macOS, & BSD. Instead of simulating internal Windows logic like a virtual machine or emulator, Wine translates Windows API calls into POSIX calls on-the-fly, eliminating the performance and memory penalties of other methods and allowing you to cleanly integrate Windows applications into your desktop.
> 
> Taken from <a href="https://www.winehq.org/">here</a>

> [!CAUTION]
> This is a working Photoshop, but he may have <a href="#problems">problems</a>. You should understand that I cannot guarantee that any of the features you typically use will work.

> [!IMPORTANT]
> **8.7 GB** The size of the folder with Photoshop `"$HOME/.photoshop_2020"`
> 
> **5.8 GB** Prefix size with Photoshop `"$HOME/.photoshop_2020/ps_prefix"`
> 
> **2.9 GB** After installation, you can delete the ps_downloads folder `"$HOME/.photoshop_2020/ps_downloads"`

The purpose of this script is to minimize the possible difficulties that users may encounter during self-installation and configuration. It provides a step-by-step guide and performs all the necessary operations so that you can focus on your work without being distracted by the technical details of the compatibility processes.

<h2 id="installation">:open_file_folder: Installation</h2>

Check what you have installed:
- wine
- winetricks
- curl

Clone the repository:

```bash
git clone https://github.com/DaniilZinoviev06/photoshop-2020-installer-linux.git
cd photoshop-2020-installer-linux
```

Run the **installer.sh**:
```bash
chmod +x installer.sh
./installer.sh
```

<h2 id="settings">:warning: Settings</h2>
 
  **If everything worked out for you and the script installed Photoshop, then you need to change some settings**
  
  Go to ```edit -> preferences -> tools``` and turn off tooltips
  
  <details><summary>image</summary><br><div align = center><img alt="Image" src="https://github.com/DaniilZinoviev06/photoshop-installer-linux/blob/master/images/settings_tooltips.png"></div></details>

<h2 id="problems">:fire: Possible problems</h2>
  <details><summary>Red screen in Camera Raw</summary><br>
    Solution: Go to the Camera Raw settings(edit -> Camera Raw -> Performance) and turn off the graphic processor. p.s also turn off tooltips!
  </details>

  <details><summary>Black initial screen, create, export as</summary><br>
    Solution: Check if there is gdiplus in the library section in the configuration of Wine. 
    <br><br>
    Alternative: edit -> preferences -> general. Turn off "Show Start workspace" and turn on "Use legacy New document". "Export as" cannot be fixed through the settings, but there is a quick export. I only had this problem on Fedora
  </details>

<h2 id="gallery">🌄 Gallery</h2>
<div align="center">
  <table><tr><td>
    <img src="https://github.com/DaniilZinoviev06/photoshop-2020-installer-linux/blob/master/images/ps_arch.png" alt="Arch"/></td><td>
    <img src="https://github.com/DaniilZinoviev06/photoshop-2020-installer-linux/blob/master/images/ps_mint.png" alt="Mint"/></td></tr>
    <tr><td>Arch</td><td>Mint</td></tr>
  </table>
</div>

<h2 id="uninstall">:red_circle: Uninstall</h2>
  <details><summary>Uninstall</summary><br>
    Launch the <strong>installer.sh</strong> and select the delete Photoshop option<br><br>
    or remove:<br><br>
    "$HOME/.photoshop_2020"<br>
    "$HOME/.local/share/applications/photoshop_2020.desktop"<br>
    "$HOME/.local/share/icons/photoshop_icon.png"<br>
  </details>

<h2 id="links">:link: Links</h2>

<a href="https://github.com/DaniilZinoviev06/photoshop-installer-linux">Photoshop CC 2018</a><br>
<a href="https://github.com/DaniilZinoviev06/illustrator-installer-linux">Illustrator</a>
