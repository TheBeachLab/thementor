# Electronics Production

* Proper use of the heat gun. Remember to put it in cold air after use until no heat comes out.

* Soldering SMD components

    * It’s not like painting. Doesn’t work like this. Soldering Iron in, Solder in, Solder out, Soldering Iron out.

    * Use the double side tape to fix the board to the table

    * Start with the microcontroller, continue towards the perimeter

    * Easy with the tweezers

    * Soldering day - No coffee

    * Use good lighting and loupes

* In groups of 2 people, Fabricate the Fab ISP

    * Prepare the Roland Modela bed and sacrificial layer

    * Download from Fab Academy Electronics production week or follow [http://fabacademy.org/archives/2015/doc/electronics_production_FabISP.html](http://fabacademy.org/archives/2015/doc/electronics_production_FabISP.html) 

    * Mill traces, cut board

    * Stuff

    * Program and Debug [http://fabacademy.org/archives/2015/doc/programming_FabISP.html](http://fabacademy.org/archives/2015/doc/programming_FabISP.html) 


## General tips
This is **one of the most important weeks in fab academy**. From now on, you will be producing electronics continuously, for your assignments and final project. So **mastering this process is essential**. This is a fast process. You can cut a board in half an hour, stuff it in say one hour and program it in another half an hour.

[Learn Simple Surface Mount Soldering in Collin’s Lab](http://makezine.com/2016/02/19/learn-simple-surface-mount-soldering-in-collins-lab/)


### Roland Modela MDX-20 tutorial
Half of fab academy assignments involve using this machine (or the SRM-20). [Adam Harris](http://fabacademy.org/archives/2014/students/harris.adam/index.html), a 2014 student made an amazing tutorial about using the Roland Modela MDX-20. This is a **mandatory watch**.

<iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/jkLJI8L7TUs?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

### To take into account
Make sure that you have at least the critical materials. I recommend that you get them from Fab Foundation or another Lab nearby. Over years I have been looking for a local replacement with no success, the quality is very poor. But do try to compare local sources if you have the chance:

* FR1 boards. Make sure they are not FR4
* 1/64 and 1/32 flat end milling bits

Also some other things to take into account:

* Milling circuit boards is a process **very sensitive to height differences**. Even a tiny bubble in the double sided tape, remains of old glue will affect the milling. Take your time to carefully prepare the board for milling.
* **Always** use a sacrificial material. I recommend another PCB board with the paper side looking up. I do not recommend acrylic or wood since the height is not consistent across the surface.
* Easy with the 1/64 milling bit. It breaks easily.

### Debugging
Finding errors in the programming step is normal. A common fail is that when there is an error the student just mills another board, and another, and another... until he succeeds. This is wrong. You have to learn how to debug your boards. You have to find and isolate where is the error. The most important thing when debugging is **reading** what is the error you are receiving, it will give you hints on how to proceed. Here you are some (not all!) things you can try:

* It can be the USB port. Try different USB ports. Problems have been reported in some USB3 ports. Try a USB hub or a USB2 port.
* It can be the USB cable. Try a different one.
* It can be something related to your computer. Try another computer.

If all of this does not work then probably there is something wrong in the ISP cable or the fabISP itself:

* Check the ISP ribbon cable polarity. Are you connecting it in the right way?
* If you fabricated the ISP ribbon cable and IDC connector inspect the terminal with a microscope. Make sure no wires are touching each other.
* Check the board in a microscope. Check all the solderings. Look for cold soldering. Check for shorts. Check for bad soldering.

There is no magic in debugging. **No one on earth will be able to tell you what happens with your board**. This is just a systematic process. Just try everything and make a debugging table so I or anyone can help you with that.

Good luck and happy electronics!

# Compiled (legacy) Fab Modules

## Installation
There are a number of reasons why you still want to keep the legacy compiled version of fab modules along with the newer web/JavaScript version. The main one is that the JavaScript version still does not allow to send straight away to the machine so you still need `fabsend` that comes with the compiled version. The second one is that you have a fall-back in case of failure. A third one is that _clearance_ (a feature you need when milling molds) is not supported in the JavaScript version. And the final one is that you need to have it if you want to run kokopelli retro.

Installation is easy, just follow the instructions found in the [kokompe project page](http://kokompe.cba.mit.edu/), install the prerequisites, download the `.zip` file, uncompress it and do:
```
make clean
make fab
sudo make install # recommended and needed for kokopelli retro
```
**Note for Linux Arch:** Download the source from [here](./files/fab_src.zip)

## Running the compiled version
Just type `fab` in a terminal window.

# JavaScript Fab Modules

## Installation
Installing the web version of fab modules can be a confusing thing because there have been many versions and now there are many contradictory tutorials out there. This is the one that is working for me.

### Install nodejs v4 LTS
```bash
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Test `node -v` it should output the nodejs version.

### Upgrade to latest npm
`sudo npm install -g npm`

Test `npm -v` it should output npm version.

### Install Websockets (ws)
If you try to install this package using `npm install --save ws` you may obtain the following error:
```bash
irix@ThinkPad-X220:~$ npm install --save ws
npm WARN saveError ENOENT: no such file or directory, open '/home/irix/package.json'
/home/irix
└── ws.js@1.0.22

npm WARN enoent ENOENT: no such file or directory, open '/home/irix/package.json'
npm WARN irix No description
npm WARN irix No repository field.
npm WARN irix No README data
npm WARN irix No license field.
irix@ThinkPad-X220:~$
```

Thanks to [Sibu](http://archive.fabacademy.org/archives/2016/fablabtrivandrum/students/281/index.html), he showed me that **the proper way to install it and make it available for all users is** `sudo npm -g install ws`

### Install python
`sudo apt-get install python python-tk python-serial`

### Clone the repository
`git clone https://github.com/FabModules/fabmodules-html5.git`

### Install mod serve
```bash
cd fabmodules-html5
chmod +x mod_server/mod_server.js
# copy files to /usr/local/bin
sudo cp -R mod_serve mod_server /usr/local/bin
sudo chmod +x /usr/local/bin/mod_serve
```

## Running the JavaScript Fab Modules
The JavaScript version requires 2 steps. One is running *mod_serve* service and the second is opening the webpage containing the fab modules.

### Running mod_serve
Just type `mod_serve &` and you will see something similar to this:
```bash
irix@ThinkPad-X220:~$ mod_serve &
[1] 3079
irix@ThinkPad-X220:~$ listening for connections from 127.0.0.1 on 12345
```

### Open Fab Modules index.html page
Open the file `index.html` located inside the fab modules cloned repository or the one in <http://fabmodules.org>.
