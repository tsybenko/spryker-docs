FROM ruby:3.2.2-slim

# Set UTF-8 locale and noninteractive apt (for any Debian-based image)
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Install build tools and other dependencies
RUN apt-get update && apt-get install -y \
    build-essential git curl nodejs npm  \
    && apt-get purge -y imagemagick imagemagick-6-common \
    && rm -rf /var/lib/apt/lists/*

# Install Bundler and project gems (including Jekyll)
RUN gem install bundler jekyll

COPY post-create.sh /usr/local/post-create.sh

# Fixing vulnerability issue by upgrading svn to 1.14.5. Ref https://subversion.apache.org/security/CVE-2024-46901-advisory.txt
COPY ./scripts/install-subversion.sh /tmp/install-subversion.sh
RUN chmod +x /tmp/install-subversion.sh
RUN /tmp/install-subversion.sh \
  && rm -f /tmp/install-subversion.sh