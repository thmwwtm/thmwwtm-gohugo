---
title: "Cloud security camera with a Raspberry Pi"
date: 2021-05-31T09:02:00+02:00
weight: 1
# aliases: ["/first"]
tags: ["malta", "security", "smb", "samba", "camera", "cctv", "raspberry", "pi", "cloud", "storage"]
author: "Me"
showToc: true
TocOpen: true
draft: false
hidemeta: false
disableShare: true
comments: false
---

## Preface, motivation 
Coming from the middle of Europe I am used to buildings prepared for cold, warm, and burglars. Meaning doors and windows are able to close tightly probably having multiple layers of insulation and other than breaking the glass in the window (what is probably not even close to glass anymore but a quite resistant plastic something).

### Malta situation

#### Construction
Then welcome to Malta where buildings are prepared only for the warm. Meaning closed doors and windows are not stopping the wind, central heating is not existing.

Now stopping the cold from getting in is not what I want to brag about, but you can imagine a window or terrace door with a visible gap when closed, and no or really weak locking mechanism, is not really stopping an unauthorized someone to come in either.

#### Public safety
You don't really hear about crimes in Malta, you don't really see people on the street who makes you feel unsafe.
Policemen are going around by car, by motorbike, on foot. So why would you bother making your window unbreakable when no one wants to break it right?

> ## Story time
> Our front balcony is facing the street it is above a garage. You won't reach it if you are not incredibly tall or put extra effort into jumping high. We were worried about having that light balcony doors there, but according to [public safety](#public-safety) we let it go. \
\
Until one night we woke up to our dog's barking. He basically never barks. So it was quite surprising, and he was staring out to the front balcony. We thought someone climbed up and tried to break in.
So for quick remediation, we thought buying a security camera would be a good idea.
> ### Fun fact
> Later it turned out probably our dog was barking on something totally irrelevant, we saw him once staring the same way out that window growling (last phase before barking) on an empty chips bag blown by the wind.

# Security system 1.0.4

## The camera
So I ordered this little guy: [Xiaomi Mi Home Security Camera 360](https://www.mi.com/global/camera-360/)
I wanted something affordable, and I wanted to able to save the recordings to the cloud or other server.
If you create a Mi account and pay a bit for a subscription you have all that in Xiaomi's cloud solution.
Other than that, you can configure the device to save recordings to a NAS.

The camera itself can take a 64GB microSD card, but you don't need to be the sharpest burglar to pick up the camera too, and boom my recordings are gone.

## The NAS
Of course, I don't want to pay for a Mi cloud, and of course, I want to hack some monstrosity together, I have a Raspberry running already, blocking ads for me, thanks to 
{{< figure src="https://avatars.githubusercontent.com/u/16827203?s=200&v=4" title="pi-hole" link="https://pi-hole.net/" style="text-align: center">}}
and it should have enough space for some archive recordings. \
\
And you are [Bamboozled](https://youtu.be/qPFTT7h6voo)! Yep, the sd card I used initially is not having too much free space, so I plugged a big enough USB drive into the pi, made it mount automatically on start, and configured it as an smb drive.

### Adding samba to Linux
[This](https://howtoraspberrypi.com/create-a-nas-with-your-raspberry-pi-and-samba/) tutorial explains everything, installing and configuring the shared folder, even mounting the pendrive on startup. One thing is missing:

#### Adding the samba user
If you created the folder shared with a specific user you won't be able to write through samba only if the samba login is the same user or the permissions are unsafe. By the way, I tried `chmod 777` and I was still not able to write the folder from outside.
So when you connect to smb from the other device you should be able to connect as the user with the same name so writing the folder is possible with 700 or 744 rights.
To add the user to samba use
```shell
> smbpasswd -a <username_here>
```
this will ask for creating the password and adds this user to samba. It does not care about the `username`, it is just a string for samba, it does not check if it is a real linux user or not, but in that case, you won't be able to use that user for too much, so make sure you provide the right user which owns the shared folder.

## The cloud
A basic burglar will take the camera, a clever one may notice the Raspberry and take that one too. So to keep the recordings safe they should be saved somewhere outside the house.
At first I was thinking about using Dropbox or Google Drive probably they are the most popular but searching a bit for the best or easiest experience on linux I quickly realized I will choose something else.
I read Mega has apps for all platforms, so I went ahead and tried it out, and boy, what a positive surprise. Easy signup, simple install, straightforward config, nice UI on all devices. Probably from the whole setup adding the cloud sync took the least time.

One thing to keep an eye on, when you join Mega, you get a bonus for everything, literally everything. Registering, installing the desktop app, installing the mobile app, and quickly your 15GB storage is 85GB but this bonus is limited in time. If you are not careful and you are using over 15GB when the bonuses expire who knows, you lose data or you pay.
By the way, you can use this link if you want to use Mega: https://mega.nz/aff=SKon_MBjW6w so I will get some credits to increase my storage a bit longer.

## Wrapping up
After all this, you can check the storage setup in the camera app. Go to the NAS option (assuming the camera and the pi is on the same network), the smb folder should show up. Add the credentials you set up. I chose to save one week of recordings to the NAS, the camera takes care of deleting the old files. I also set it up to record only when motion is detected. This way it can fit the 8GB pendrive I added, the biggest the folder got is 7.3GB to date, but usually, it is under 7 closer to 6. Since the shared folder cannot go over 8GB this will never reach the storage limit.

You may notice the version number 1.0.4 in the title, yes this was also a bit of try and fail mostly around the user and permissions.