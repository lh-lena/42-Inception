# 42-Inception
Unlocking the Power of Containerization!

<details>
  <summary>Set up your enviroment in your VM</summary>

Add a User to the different Groups on Debian/Ubuntu-based distribution

Switch to the root user or another user with sudo privileges:
	
	* log in as root:
		su -
		sudo adduser login
		sudo usermod -aG sudo login
		sudo usermod -aG docker login
	* or log in with another user with sudo privileges and use `sudo`
	
	Log back to `login` user
	    su login 
	To verify the addition. Should return `root`
	    sudo whoami
	
	
Directly Editing the sudoers File
	
	1. log in as root:
	    su -
	2. This command safely edits the sudoers file:
	    visudo
	3. Add a line like this to give <login> sudo privileges:
	   <login> ALL=(ALL) ALL
</details>

<details>
  <summary>Shared folder</summary>

1. Ensure the vboxsf module is loaded:
    sudo modprobe vboxsf
2. Add an entry to /etc/fstab:
    shared_folder_name  /path/to/mount/point  vboxsf  defaults  0  0
3. After any changes in /etc/fstab run:
    systemctl daemon-reload
4. After adding the entry to /etc/fstab, mount the shared folder without rebooting:
    sudo mount -a

Maunt manually:

	sudo mount -t vboxsf <FolderName> /path/to/mount/point

</details>


<details>
  <summary>Install Docker</summary>


```bash
    sudo apt update && apt install docker.io -y
```

Install Docker Compose -> 
```href
    https://docs.docker.com/compose/install/linux/#install-using-the-repository
```

Docker Compose Contribute documentation
```href
    https://github.com/docker/compose/blob/main/CONTRIBUTING.md
```

Dockerfile 
```href
    https://docs.docker.com/build/building/packaging/
```

</details>


<details>
  <summary>notes</summary>


Create a password to the DB
$ openssl rand -base64 32 > db_password.txt
$ openssl rand -base64 32 > db_root_password.txt

PASSWORD=$(tp -dc a-zA-Z0-9 < /dev/urandom | head -c 12)
mysql -u root -p <<EOF
creat database $HOSTNAME;


Configuration mariadb:
apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

- modify bind-address 0.0.0.0 to listen on all network interfaces
$ /etc/mysql/mariadb.conf.d/50-server.cnf
- to start the MariaDB service
$ service mysql start
- check its status (If MariaDB is running, it should show that it's active.)
$ service mysql status
</details>
