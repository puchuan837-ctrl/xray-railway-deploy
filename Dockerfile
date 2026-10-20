FROM teddysun/xray:latest

COPY config-template.json /etc/xray/config-template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
