Title: How To Use UUID To Mount Partitions
Date: 2015-09-22 08:10
Tags: uuid, fstab

[A Universally Unique Identifier (UUID)](http://en.wikipedia.org/wiki/UUID) is an identifier standard used in software construction, standardized by the Open Software Foundation (OSF) as part of the Distributed Computing Environment (DCE). The intent of UUIDs is to enable distributed systems to uniquely identify information without significant central coordination. Thus, anyone can create a UUID and use it to identify something with reasonable confidence that the identifier will never be unintentionally used by anyone for anything else. Information labeled with UUIDs can therefore be later combined into a single database without needing to resolve name conflicts.

Linux's ext2/ext3 filesystem uses UUID to identify partitions.


#### List all UUIDs

Use blkid command-line utility to locate/print block device attributes:
```sh
$ sudo blkid
```

Alternatively you can list them from their listing in your root filesystem:
```sh
ls -l /dev/disk/by-uuid/
```


#### /etc/fstab file format

Simply use following syntax as example:

```
UUID={YOUR-UID}    {/path/to/mount/point}               {file-system-type}    defaults,errors=remount-ro 0       1
```

or it will be better to check `man fstab` for your operation system

#### Mount new partition 

```sh
$ sudo mount -a
```


#### How to remove GPT from HDD?

```sh
$ sudo parted /dev/sdX
(parted) mklabel msdos
Warning: The existing disk label on /dev/sdX will be destroyed and all data on this disk will be lost. Do you want to continue?
Yes/No? Yes  
(parted) quit
$
``` 


## Links

- [How To Use UUID To Mount Partitions](http://www.cyberciti.biz/faq/linux-finding-using-uuids-to-update-fstab/)
- [Ubuntu Community wiki/UsingUUID](https://help.ubuntu.com/community/UsingUUID)
- [Ubuntu Community wiki/AutomaticallyMountPartitions](https://help.ubuntu.com/community/AutomaticallyMountPartitions)
