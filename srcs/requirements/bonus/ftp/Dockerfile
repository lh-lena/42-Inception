FROM debian:buster

RUN apt-get update && \
    apt-get install -y vsftpd ufw && \
	rm -rf /var/lib/apt/lists/*

ARG FTP_USER
ARG FTP_PASS

# Create FTP user and set up home directory for FTP access
RUN useradd -m -d /home/$FTP_USER -s /bin/bash $FTP_USER && \
    echo "$FTP_USER:$FTP_PASS" | chpasswd && \
    mkdir -p /home/$FTP_USER/ftp && \
    chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp && \
    chmod a-w /home/$FTP_USER/ftp

# Configure vsftpd for FTP access and passive mode
RUN echo "listen=YES" > /etc/vsftpd.conf && \
    echo "anonymous_enable=NO" >> /etc/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf && \
    echo "local_umask=022" >> /etc/vsftpd.conf && \
    echo "dirmessage_enable=YES" >> /etc/vsftpd.conf && \
    echo "use_localtime=YES" >> /etc/vsftpd.conf && \
    echo "xferlog_enable=YES" >> /etc/vsftpd.conf && \
    echo "connect_from_port_20=YES" >> /etc/vsftpd.conf && \
    echo "chroot_local_user=YES" >> /etc/vsftpd.conf && \
    echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf && \
    echo "pasv_min_port=$PASV_MIN_PORT" >> /etc/vsftpd.conf && \
    echo "pasv_max_port=$PASV_MAX_PORT" >> /etc/vsftpd.conf && \
    echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd.conf && \
    echo "secure_chroot_dir=/var/run/vsftpd/empty" >> /etc/vsftpd.conf && \
    echo "pam_service_name=vsftpd" >> /etc/vsftpd.conf

# Expose FTP control port (21) and passive ports (21100-21110)
EXPOSE 21 21100-21110

# Start vsftpd in the foreground
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]