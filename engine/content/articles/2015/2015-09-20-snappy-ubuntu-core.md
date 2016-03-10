Title: Snappy Ubuntu Core
Date: 2015-09-20 10:30
Tags: ubuntu, snappy, core, vagrant, install

Snappy Ubuntu Core is a new rendition of Ubuntu with transactional updates - a minimal server image with the same libraries as today’s Ubuntu, but applications are provided through a simpler mechanism.

The snappy approach is faster, more reliable, and lets us provide stronger security guarantees for apps and users — that’s why we call them “snappy” applications.

Snappy apps and Ubuntu Core itself can be upgraded atomically and rolled back if needed — a bulletproof approach that is perfect for deployments where predictability and reliability are paramount. It’s called “transactional” or “image-based” systems management, and we’re delighted to make it available on every Ubuntu certified cloud.


### Get started

First of all, please enable the snappy tools PPA, which includes the latest tools needed to develop for snappy. You can open a terminal and run these commands:

```sh
$ sudo add-apt-repository ppa:snappy-dev/tools
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install snappy-tools bzr
```


#### [Vagrant images](https://developer.ubuntu.com/en/snappy/start/#vagrant)

Snappy Images for Vagrant. These images are bit-for-bit the same as the KVM images, but packaged for Vagrant. A special "cloud-config" drive is included that enables SSH.

On Ubuntu 14.04 or later, you need to install Vagrant:

```sh
$ sudo apt-get update
$ sudo apt-get -y install vagrant
```

After Vagrant is installed

```sh
$ vagrant init http://cloud-images.ubuntu.com/snappy/15.04/core/stable/current/core-stable-amd64-vagrant.box
$ vagrant up
$ vagrant ssh
```

After you are done with the image, you can shut it down with `vagrant shutdown` or `vagrant destroy` to remove the image.


#### [x86 devices](https://developer.ubuntu.com/en/snappy/start/#try-x86)

The quickest way to try snappy on your x86 bare metal machine is to use a USB storage device that can boot just as if it were a real, built-in disk.

Just attach a USB storage device that is 4Gb or larger to a machine running Linux and type the following commands:

```sh
$ wget http://releases.ubuntu.com/15.04/ubuntu-15.04-snappy-amd64-generic.img.xz
$ unxz -c ubuntu-15.04-snappy-amd64-generic.img.xz | sudo dd of=/dev/sdX bs=32M
$ sync
```

Notes:

- Don't forget to unmount USB stick: `sudo umount /media/$USER/*`
- You must specify the path to the disk device representing your USB stick in the dd command above. Common device paths for the USB disk device are of the form /dev/sdX (such as /dev/sdb, not /dev/sdb1!). Careful when specifying the device name to avoid replacing your main disk!
- Ensure there is no data you care about on the USB stick before running the dd command above.

After that is done, attach the USB device to the machine you want to try snappy with and ensure that the boot order in BIOS/UEFI is set to try that USB storage device first.

Next, ensure the device is connected to your internal network, power it on, and snappy will come up in no time. Once it is up you will be able to log in using SSH:

```sh
$ ssh webdm.local -ubuntu   # password: ubuntu
```

### Links

- [Snappy Ubuntu Core](https://developer.ubuntu.com/en/snappy/)
- [Ubuntu Core (Snappy) Cloud Image Builds](http://cloud-images.ubuntu.com/snappy/)  are pre-installed disk images that have been customized by Ubuntu engineering to run on cloud-platforms such as Amazon EC2, Openstack and LXC.
- [Ubuntu Core Tutorials](https://developer.ubuntu.com/en/snappy/tutorials/)
- [Ubuntu Core Guides](https://developer.ubuntu.com/en/snappy/guides/)
- [Participate in Ubuntu Core development](https://developer.ubuntu.com/en/snappy/participate/)
- [Snapcraft](https://developer.ubuntu.com/en/snappy/snapcraft/)


