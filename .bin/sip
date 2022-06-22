#!/bin/python3

"""Simple Image Blurring and Brightness shifting tool
Usage:
    sip <imagepath> [--output <opath>]
    sip [--brightness <factor>] [--blur <radius>] <imagepath> [--show | --detail] 
        [--output <opath>]
    sip [--version] [--help]
    

Options:
    -h --help                           Display help message
    -b <factor>, --brightness <factor>  Brightness factor from 0 to 1
                                        [default: 0.5]
    -l <radius>, --blur <radius>        Gaussian blur radius factor 
                                        [default: 5]
    -s --show                           Display output image [default: .]
    -d --detail                         output in stdout   
    -o <opath> --output <opath>         output path
    --version                           Display version
"""
__version__ = 1.0

from docopt import docopt
from PIL import Image, ImageFilter, ImageEnhance
import os,sys


class Sip:
    def __init__(self, *, image_path, brightness, blur_radius):
        self.image_path = image_path
        self.brightness = brightness
        self.blur_radius = blur_radius

    def is_valid_path(self):
        return os.path.exists(self.image_path) 

    def is_valid_brightness(self):
        try:
            float(self.brightness)
        except ValueError:
            return False
        return 0 < float(self.brightness) < 1

    def is_valid_blur(self):
        if not self.blur_radius.isnumeric():
            return False
        return int(self.blur_radius) >= 0


    def details(self):
        print(f"brightness:     {self.brightness} ")
        print(f"blur:           {self.blur_radius} ")
        print(f"image path:     {self.image_path} ")

    def process(self):
        errors = []
        if not self.is_valid_path():
            errors.append(f"Error: {self.image_path} is not a valid path")

        if not self.is_valid_brightness():
            errors.append(f"Error: brightness must be in range between 0 and 1. Got {self.brightness}")

        if not self.is_valid_blur():
            errors.append(f"Error: unexpected blur value. Positive int expected. Got {self.blur_radius}")

        if len(errors) > 0:
            for error in errors: 
                print(error)
            return


        with Image.open(self.image_path) as oim:
            oim = oim.convert('RGB')
            im = oim.filter(ImageFilter.GaussianBlur(radius=int(self.blur_radius)))
            enhancer = ImageEnhance.Brightness(im)
            im_enhanced = enhancer.enhance(float(self.brightness))
            return im_enhanced



if __name__ == '__main__':
    arguments = docopt(__doc__, version=__version__)
    blur = arguments['--blur']
    brightness = arguments['--brightness']
    image_path = arguments['<imagepath>']
    to_show = arguments['--show']
    to_show_detail = arguments['--detail']
    output = arguments['--output']

    
    if len(sys.argv) == 1:
        print(__doc__)
        sys.exit()
    
    sip = Sip(image_path=image_path, brightness=brightness, blur_radius=blur)
    im = sip.process()

    if to_show_detail:
        sip.details()
        sys.exit()
    
    if to_show:
        print("Displaying image...")
        im.show()

    if output != None:
        try:
            im.save(output)
        except ValueError:
            print("Error: Please provide valid output file with proper (ext)")
