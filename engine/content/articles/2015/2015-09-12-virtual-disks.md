Title: Virtual Disks
Date: 2015-09-12 22:30
Tags: virtual, disk, format, amazon, ubuntu

### Disk Format

The disk format of a virtual machine image is the format of the underlying disk image. Virtual appliance vendors have 
different formats for laying out the information contained in a virtual machine disk image.

You can set your image’s disk format to one of the following:

- **raw**: This is an unstructured disk image format
- **vhd**: This is the VHD disk format, a common disk format used by virtual machine monitors from VMWare, Xen, 
Microsoft, VirtualBox, and others
- **vmdk**: Another common disk format supported by many common virtual machine monitors
- **vdi**: A disk format supported by VirtualBox virtual machine monitor and the QEMU emulator
- **iso**: An archive format for the data contents of an optical disc (e.g. CDROM).
- **qcow2**: A disk format supported by the QEMU emulator that can expand dynamically and supports Copy on Write
- **aki**: This indicates what is stored in Glance is an Amazon kernel image
- **ari**: This indicates what is stored in Glance is an Amazon ramdisk image
- **ami**: This indicates what is stored in Glance is an Amazon machine image

### Container Format

The container format refers to whether the virtual machine image is in a file format that also contains metadata 
about the actual virtual machine. You can set your image’s container format to one of the following:

- **bare**: This indicates there is no container or metadata envelope for the image
- **ovf**: This is the OVF container format
- **aki**: This indicates what is stored in Glance is an Amazon kernel image
- **ari**: This indicates what is stored in Glance is an Amazon ramdisk image
- **ami**: This indicates what is stored in Glance is an Amazon machine image

### Ubuntu Cloud images

- [Ubuntu Cloud Images](http://cloud-images.ubuntu.com/)

### Create a qcow2 disk image

First, let’s create a qcow2 disk image using ‘qemu-img’ tool

```sh
$ /usr/bin/qemu-img create -f qcow2 -o preallocation=metadata /export/vmimgs/glacier.qcow2 8G
```

NOTE: At this point in time, preallocation=metadata option is the best we can do to extract max. possible (near RAW) I/O performance out of QCOW2 format. (hint from Kevin Wolf – Qemu/Qcow2 developer )


