# Start from a light-weight ruby image
FROM ruby:3.1.2-alpine

# Install gcc and make 
RUN apk add build-base

# Update config
ENV GEM_HOME=$HOME/gems PATH=$HOME/gems/bin:$PATH

# Install jekyll
RUN gem install jekyll bundler

# Make directory for site
WORKDIR /site

# The Jekyll server runs on port 4000 by default
EXPOSE 4000

# Make entry point file for docker
COPY docker-entrypoint.sh /usr/local/bin

# Install the required gems for the site
ENTRYPOINT ["sh", "docker-entrypoint.sh" ]

# Run jekyll-serve for dynamic development
CMD [ "bundle", "exec", "jekyll", "serve", "--livereload", "-H", "0.0.0.0", "-P", "4000"]
