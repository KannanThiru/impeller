FROM alpine:3.8
ENV HELM_VERSION=v2.10.0
ENV KUBECTL_VERSION=v1.11.0

RUN cd /tmp && \
    wget -O /tmp/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -xvf /tmp/helm.tar.gz && \
    cp linux-amd64/helm /usr/bin/ && \
    chmod +x /usr/bin/helm && \
    rm -rf /tmp/helm.tar.gz /tmp/linux-amd64
RUN wget -O /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x /usr/bin/kubectl
RUN mkdir /root/.kube
ENTRYPOINT ["/usr/bin/propeller"]
COPY helm-propeller /usr/bin/propeller
