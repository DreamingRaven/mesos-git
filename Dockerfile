FROM archlinux:latest
ARG user_name=archie
ARG user_password=archer
RUN pacman -Syyuu sudo base-devel --noconfirm && \
    pacman -S python jre-openjdk-headless git make cmake --noconfirm
RUN pacman -S openssl --noconfirm
RUN useradd -m -p $(openssl passwd -1 ${user_password}) ${user_name} && \\
    echo "${user_name} ALL=(ALL) ALL" >> /etc/sudoers && \\
    echo "${user_name} ALL=(ALL) NOPASSWD:/usr/bin/pacman" >> /etc/sudoers
USER ${user_name}
COPY . /home/$(user_name)/pkg
RUN makepkg -s --noconfirm && \\
    echo "${user_password}" | sudo -S pacman -U *pkg.tar.xz --noconfirm
