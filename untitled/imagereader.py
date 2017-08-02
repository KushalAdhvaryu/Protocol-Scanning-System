
#! /usr/bin/env python

import argparse
import re
import xml.etree.ElementTree as ET
import zipfile
import os
import sys


nsmap = {'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'}
nmspc = {'v': 'urn:schemas-microsoft-com:vml'}





def qn(tag):
    """
    Stands for 'qualified name', a utility function to turn a namespace
    prefixed tag name into a Clark-notation qualified tag name for lxml. For
    example, ``qn('p:cSld')`` returns ``'{http://schemas.../main}cSld'``.
    Source: https://github.com/python-openxml/python-docx/
    """

    prefix, tagroot = tag.split(':')
    if prefix == 'w':
        uri = nsmap[prefix]
    else:
        uri = nmspc[prefix]

    return '{{{}}}{}'.format(uri, tagroot)




def xml2text(xml):
    """
    A string representing the textual content of this run, with content
    child elements like ``<w:tab/>`` translated to their Python
    equivalent.
    Adapted from: https://github.com/python-openxml/python-docx/
    """
    imagecounter =0
    text = u''
    root = ET.fromstring(xml)
    for child in root.iter():

        if child.tag == qn('w:t'):
            t_text = child.text
            text += t_text if t_text is not None else ''
            text += '\n'
        elif child.tag == qn('v:imagedata'):
            # print child
            # print child.tag
            # print child.attrib
            # for attribute in child.attrib:
            #     if attribute == 'path':
            #         print imagecounter
            imagecounter += 1
        # elif child.tag == qn('w:tab'):
        #     text += '\t'
        # elif child.tag in (qn('w:br'), qn('w:cr')):
        #     text += '\n'
        # elif child.tag == qn("w:p"):
        #     text += '\n\n'
    return imagecounter


def process(docx, img_dir=None):
    text = u''

    # unzip the docx in memory
    zipf = zipfile.ZipFile(docx)
    filelist = zipf.namelist()
    imagecount = 0

    for fname in filelist:
        _, extension = os.path.splitext(fname)
        if extension in [".jpg", ".jpeg", ".png", ".bmp"]:
            imagecount += 1
    print imagecount
    # get main text
    doc_xml = 'word/document.xml'
    # text += xml2text(zipf.read(doc_xml))
    print(xml2text(zipf.read(doc_xml)))



    # if img_dir is not None:
    #     # extract images
    #     for fname in filelist:
    #         _, extension = os.path.splitext(fname)
    #         if extension in [".jpg", ".jpeg", ".png", ".bmp"]:
    #             dst_fname = os.path.join(img_dir, os.path.basename(fname))
    #             with open(dst_fname, "wb") as dst_f:
    #                 dst_f.write(zipf.read(fname))

    # zipf.close()
    # return text.strip()
    return

if __name__ == '__main__':
    text = process("img.docx", "C:\\Users\\kadhvary\\PycharmProjects\\untitled\\pictures")
    # sys.stdout.write(text.encode('utf-8'))
