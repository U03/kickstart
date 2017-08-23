#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=fr --xlayouts='fr'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=static --device=ens192 --gateway=192.168.1.1 --ip=192.168.1.214 --nameserver=8.8.8.8 --netmask=255.255.255.0 --noipv6 --activate
network  --hostname=ansible0

# Root password
rootpw --iscrypted $6$cSafLp3Idr3Br9G5$2nRWKOz41XtE1Wp9gm/Cq2dHqHiQRe8y1b76e6DmoSYhY.5xcfgkf7nlFPcA4n6JhJL2t6UndAOBAdI5MlRcE1
# System services
services --disabled="chronyd"
# System timezone
timezone Etc/GMT --isUtc --nontp
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel

%packages
@^minimal
@core
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=50 --notstrict --nochanges --notempty
pwpolicy luks --minlen=6 --minquality=50 --notstrict --nochanges --notempty
%end

%post
mkdir -m0700 /root/.ssh/
cat <<EOF >/root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABRme40WUpB+6JW8Qv6Jbw8mswyTLjgYGxh97Hp35vg3SBIrVfEoGw7jYwRmo2Xf5zMx1orxNcTUnvSGRusoY6CdR28129sfzsIxV7Zh9EMisDt6lXra+CdescSQG3UNiQ0KcIoS24N/zyImdkXkxrDeeqHPiw9FFNpAbFnwNQx7VCwiwJgjII2wVSYYYBcnpTRzqU8PL0HSU9xcDKn5n9iuD8pFAieF1nSP6k2e6E7hOuPEkIkSkemUedUS6t2BS+pUZqg4bbMDcSCz7OL0acjyvdHmlkcdjNJzPsEFdqZ7eKBTwkOFS3ot7brpRtG8AMjDKx0KQHUawm8S2vPW3RjhD4QB2osPpvmokKLyvP4mZy0II3RN9ga69nwntKEBGUbclAwBEQwUE0l0MhknLymVbABtbmllO54X8R940LTyVfXC92RXL/F3j5iJB91WtUwf5ODLB96rp09I4IJI31oEkW7r0cV2NbvusYSZBaD/PVZoV9h5i2oz8UospaGHjoce4cJG+ZOLKB/lUM778rXVL/oFFm2TRMEOH4x2yBq0EyJo4o+cOquWhj29FFCB2yylpWhpi42Nf80qXM0d7jKxwaKkS7R7ZdM1eAJ44B/gV57Msqiiw== U03 Takeshiba
EOF
chmod 0600 /root/.ssh/authorized_keys
restorecon -R /root/.ssh/
%end
