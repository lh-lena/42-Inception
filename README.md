# 42-Inception
Unlocking the Power of Containerization!

## How to set up your enviroment in your VM

### Add a User to the different Groups on Debian/Ubuntu-based distribution

Switch to the root user or another user with sudo privileges:

* log in as root:
```bash
    su -
```
* or log in with another user with sudo privileges and use `sudo`


```bash
    sudo adduser login
```
```bash
    sudo usermod -aG sudo login
```
```bash
    sudo usermod -aG docker login
```

Log back to `login` user
```bash
    su login 
```
To verify the addition. Should return `root`
```bash
    sudo whoami
```

<!-- 
Directly Editing the sudoers File (Advanced)
If you need to edit the sudoers file directly:

Use the visudo command:

This command safely edits the sudoers file:
bash
Copy code
visudo
Add the user:

Add a line like this to give ohladkov sudo privileges:
bash
Copy code
ohladkov ALL=(ALL) ALL
Save and exit the editor.
Be careful when editing the sudoers file, as a syntax error can cause issues with sudo access. -->

## shared folder

1. Ensure the vboxsf module is loaded:
    sudo modprobe vboxsf
2. Add an entry to /etc/fstab:
    shared_folder_name  /path/to/mount/point  vboxsf  defaults  0  0
3. After any changes in /etc/fstab run:
    systemctl daemon-reload
After adding the entry to /etc/fstab, mount the shared folder without rebooting:
    sudo mount -a



## Install Docker

```bash
    sudo apt update
```
```bash
    sudo apt install docker.io -y
```

Install Docker Compose -> 
```href
    https://docs.docker.com/compose/install/linux/#install-using-the-repository
```

Docker Compose Contribute documentation
```url
    https://github.com/docker/compose/blob/main/CONTRIBUTING.md
```

Dockerfile 
```href
    https://docs.docker.com/build/building/packaging/
```

Create a password to our DB
$ openssl rand -base64 32 > db_password.txt
$ openssl rand -base64 32 > db_root_password.txt