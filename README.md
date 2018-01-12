# Rubber-Ducky-Arming-Wizard (RDAS Wizard)
Rubber Ducky arming script wizard : quickly setup your Rubber Ducky 

Rubber Ducky Arming Script (RDAS) is an interactive script, it allows you to quickly arm your Ducky with payloads just by answering questions from the menu. No need to create manually your inject.bin, RDAS does it all.

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
- Download java encoder (hak5darren duckencoder.jar) and python encoder (clone kevthehermit DuckToolkit)
- Install RDAS

## OS compatibility
| OS            | Status        |
| ------------- |:-------------:|
| Linux         | stable        |
| OSx           | @todo         |
| Windows       | @NopeNotMe    |

## Installation & Usage
#### Installation
Always execute the RDAS in the root of Rubber Ducky :
- Clone this repo, move the rd-arming-wizard to Root of your Rubber Ducky and execute it.
OR
- You can also execute it directly from github without cloning it :
```shell
source <(curl -s https://raw.githubusercontent.com/maverick193/Rubber-Ducky-Arming-Wizard/master/rd-arming-wizard.sh)
```
and follow the duck

#### Folder structure

#### Installing/Creating your payloads

#### Usage

## Support and Contribution
If you have any issues with this extension, please open an issue on Github.

Any contributions are highly appreciated. If you want to contribute, please open [pull request on GitHub](https://help.github.com/articles/using-pull-requests).

## License
License   : [OSL - Open Software Licence 3.0](http://opensource.org/licenses/osl-3.0.php).

## Donation
