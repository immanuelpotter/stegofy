# stegofy
Adaptation of python stego from blog.justsophie.com, to quickly hide strings in images
Original code found at https://github.com/srli/image_steganography
Quoted from her page: This code uses the Python Pillow library. Install with "sudo pip install pillow"

This script enables you to pass an image at the command line, and either encode a hidden string in it, or the reverse.

Usage: ./stegofy /path/to/image/to/manipulate

You'll be asked for encode mode or decode mode.

In encode mode - type the string you want to hide in the image.
In decode mode - let it do the work. Worth mentioning that it's only been tested on images which have had least-significant-bit
stego applied to them, as per the encode mode in this script. In a nutshell, it won't get you far decoding other people's stuff,
but if someone else uses this script also you can have fun sending messages back and forth.

Encoded/decoded images are written out to /tmp/images, if that folder doesn't exist, the script will create it for you.
Obviously, if you don't want to lose them on reboot, move/copy them out of there.

TODO: installer script so can be ran from anywhere
      pass in arguments -e/--encode or -d/--decode from command line to skip interactive mode selection
