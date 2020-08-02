FROM registry.fedoraproject.org/fedora:latest

ENV SUMMARY="An unidentifiable mechanism that helps you avoid censorship" \
    DESCRIPTION="An unidentifiable mechanism that helps you avoid censorship."

ENV NAME=trojan VERSION=0 ARCH=x86_64
LABEL   com.redhat.component="$NAME" \
        name="$NAME" \
        version="$VERSION" \
        architecture="$ARCH" \
        summary="$SUMMARY" \
        description="$DESCRIPTION" \
        url="https://src.fedoraproject.org/container/$NAME" \
        run="podman run -v your-trojan-folder:/etc/trojan:z -p 443:443 IMAGE" \
        maintainer="Qiyu Yan <yanqiyu@fedoraproject.org>"

EXPOSE 1080

RUN dnf -y --setopt=tsflags=nodocs install trojan && \
    dnf clean all 

COPY help.md /

VOLUME ["/etc/trojan"]

ENTRYPOINT ["/usr/bin/trojan"]
