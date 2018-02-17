# stegofy
Adaptation of python stego from blog.justsophie.com, to quickly hide strings in images

Original code found at https://github.com/srli/image_steganography

Quoted from her page: This code uses the Python Pillow library. Install with "sudo pip install pillow" if not running the docker container

This script enables you to pass an image at the command line, and either encode a hidden string in it, or the reverse.

      Usage: ./stegofy /path/to/image/to/manipulate

      You'll be asked for encode mode or decode mode.

In encode mode - type the string you want to hide in the image.
In decode mode - let it do the work. Worth mentioning that it's only been tested on images which have had least-significant-bit stego applied to them, as per the encode mode in this script. In a nutshell, it won't get you far decoding other people's stuff, but if someone else uses this script also you can have fun sending hidden messages back and forth inside images.

Encoded/decoded images are written out to /tmp/images, if that folder doesn't exist, the script will create it for you.
Obviously, if you don't want to lose them on reboot, move/copy them out of there.

NB: This script is saving everything as a .png by default - take into account when decoding as this may have changed the suffix.

Directions for use:

1) Clone this repository.
```
      git clone https://github.com/immanuelpotter/stegofy
```
2) cd into where you've cloned it, and build the container:
```
      cd stegofy/
   ```   
Run:
```
   docker build -t stegocontainer .
```      
3) mount as a volume the image file(s) you want to stegofy when you run the built image:
```
      docker run -d -p 8080:80 -v /path/to/image/locally:/root/image -it stegocontainer bash
   ``` 
4) Exec into the container to operate
```
      docker exec -it <container sha given above> bash
   ```   
5) Start the apache service (won't work in Dockerfile - find out why)
```
      service apache2 start
   ```   
6) Encode/decode image file passed in during mount (at step 3)
```
      stegofy /root/image
   ```   
7) Move the results of step 6 into apache dir to be served up
```
      mv /tmp/images/* /var/www/html/
   ```   
8) View encoded/decoded content in the browser.
```
      Navigate to localhost:8080 on your host machine.
   ```   
There's the rendered content which you can save onto the host by right clicking!

TODO:
      verify_image() is redundant at the moment
      pass in arguments -e/--encode or -d/--decode from command line to skip interactive mode selection
      tidy up/refactor
