FROM bitnami/minideb:buster
MAINTAINER Geoffrey Bergeret <geoffrey@gbergeret.com>

RUN apt update \
    && apt upgrade -y \
    && apt install -y boinc-client

WORKDIR /var/lib/boinc-client

CMD /etc/init.d/boinc-client start \
    && sleep 5 \
    && /usr/bin/boinccmd --project_attach $BOINC_PROJECT_URL $BOINC_ACCOUNT_KEY \
    && tail -f /var/lib/boinc-client/std*.txt
