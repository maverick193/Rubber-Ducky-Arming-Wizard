# Rubber-Ducky-Arming-Wizard (RDAS Wizard)
Setup and arm your Rubber Ducky in couple of seconds

Rubber Ducky Arming Script (RDAS) is an interactive script, which allows you to quickly arm your Ducky with payloads just by answering questions from the menu. No need to create manually your inject.bin, RDAS does it all.

<p align="center">
  <img src="https://user-images.githubusercontent.com/1863000/34879289-072ffc98-f7ad-11e7-8202-7123108c5286.png" alt="Rubber Ducky Arming Wizard">
</p>

## What does this wizard do ?
On a fresh Rubber SD Card, this wizard will do the following :
- Check your internet connexion (in order to download the encoders)
- Check the dependencies on your local machine (git, curl, tar)
- Ask to backup previous version (if it exists)
- Cleanup previous version
- Create folder structure
- Download java encoder (hak5darren [duckencoder.jar](https://github.com/hak5darren/USB-Rubber-Ducky)) and python encoder (clone kevthehermit [DuckToolkit](https://github.com/kevthehermit/DuckToolkit))
- Install RDAS (Rubber Ducky Arming Script)

## OS compatibility
| OS            | Status        |
| ------------- |:-------------:|
| Linux         | stable        |
| OSx           | @todo         |
| Windows       | @NopeNotMe    |

## Installation & Usage
#### Installation
Always execute the RDAS in the root of Rubber Ducky either by :
- Cloning this repo, move the rd-arming-wizard to Root of your Rubber Ducky and execute it.

OR
- You can also execute it directly from github without cloning it :
```shell
$ source <(curl -s https://raw.githubusercontent.com/maverick193/Rubber-Ducky-Arming-Wizard/master/rd-arming-wizard.sh)
```
and follow the duck

#### Folder structure
```
.
+-- rd-arming.sh (RDAS) : the Rubber Ducky Arming Script
+-- RD
|   +-- tools
|       +-- encoder
|           +-- java
|           +-- python
|   +-- payloads
|       +-- Linux 
|       +-- Windows
|       +-- OSX
```
- **rd-aming.sh (RDAS) :** the Rubber Ducky Arming Script
- **RD/tools/encoder :** folder which contains the java and python encoders
- **RD/payloads/Linux :** your payloads that work on Linux victim machine
- **RD/payloads/Windows:** your payloads that worked on Windows victim machine
- **RD/payloads/OSX** your payloads that worked on OSX victim machine

#### Installing/Creating your payloads
If you want to install or create your own payload, do as follow so the RDAS can load and arm it :
- Create a folder in RD/payloads/[Your_Target_OS]/ with the name of your payload.
- Inside this folder create your Ducky Script and name it payload.txt
- In the same folder, create a info.txt which contains information about your payload (author, description, version, etc ...). This file will be read when you choose to display the current armed payload
- If your payload needs other files (executable, scripts, etc ...), create (in the same folder) a new folder called extras and put those extra files, RDAS will copy them in RubberDucky root folder when your'll arm your payload (and delete them when you arm another one)

#### Usage
```shell
$ bash rd-arming.sh
```
and follow the <img width="60" height="50" src="https://user-images.githubusercontent.com/1863000/34887445-d79e1af4-f7c6-11e7-890e-116b92d68fae.png">

## Support and Contribution
If you have any issues with this extension, please open an issue on Github.

Any contributions are highly appreciated. If you want to contribute, please open [pull request on GitHub](https://help.github.com/articles/using-pull-requests).

## Credits
[hak5darren](https://github.com/hak5darren/USB-Rubber-Ducky) && [kevthehermit](https://github.com/kevthehermit/DuckToolkit)

## License
License   : [OSL - Open Software Licence 3.0](http://opensource.org/licenses/osl-3.0.php).

## Donation
