# Cassandra test
FROM cassandra:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean

# Install yq
RUN wget https://github.com/mikefarah/yq/releases/download/v4.13.4/yq_linux_amd64 -O /usr/bin/yq && \
    chmod +x /usr/bin/yq
RUN echo $(cat config.yaml | jq -r '.materialized_views_enabled')
RUN yq e '.materialized_views_enabled = true' -i /etc/cassandra/cassandra.yaml
RUN echo $(cat config.yaml | jq -r '.materialized_views_enabled')
